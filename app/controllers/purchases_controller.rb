class PurchasesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_item, only: [:index, :create]
    before_action :set_condition, only: [:index, :create]
  
    def index
      @buyer_history_order = BuyerHistoryOrder.new
    end
  
    def create
      @buyer_history_order = BuyerHistoryOrder.new(buyer_history_params)
      if @buyer_history_order.valid?
        pay_item
        @buyer_history_order.save
        redirect_to root_path
      else
        render :index
      end
    end
  
    private
  
    def buyer_history_params
      params.require(:buyer_history_order).permit(:name,
                     :address, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
    end
  
    def set_item
      @item = Item.find(params[:item_id])
    end
  
    def set_condition
      if @item.buyer_history.present? || current_user == @item.user
        redirect_to root_path
      end
    end
  
    def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
        Payjp::Charge.create(
          amount: @item.price,
          card: buyer_history_params[:token],
          currency: 'jpy'
        )
    end
  
end
