require 'rails_helper'

RSpec.describe BuyerHistoryOrder, type: :model do
  before do
    
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @buyer_history_order = FactoryBot.build(:buyer_history_order, user_id:@user.id, item_id:@item.id)
    sleep 0.1
  end
  describe '商品購入' do
    context '商品購入できるとき' do
      it '全ての項目の入力が正しく入力されていれば購入できる' do
        expect(@buyer_history_order).to be_valid
      end
    end

    context '商品購入できないとき' do
      it 'クレジット情報が空の場合は購入できない' do
        @buyer_history_order.token = nil
        @buyer_history_order.valid?
        expect(@buyer_history_order.errors.full_messages).to include("Token can't be blank")
      end

      it '名前が空だと購入できない' do
        @buyer_history_order.name = ''
        @buyer_history_order.valid?
        expect(@buyer_history_order.errors.full_messages).to include("Name can't be blank")
      end

      it '住所が空だと購入できない' do
        @buyer_history_order.address = ''
        @buyer_history_order.valid?
        expect(@buyer_history_order.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号が空では購入できない' do
        @buyer_history_order.phone_number = ''
        @buyer_history_order.valid?
        expect(@buyer_history_order.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号は半角数値でないと購入できない' do
        @buyer_history_order.phone_number = '０８０１２３４５６７８'
        @buyer_history_order.valid?
        expect(@buyer_history_order.errors.full_messages).to include("Phone number is not a number")
      end

      it '電話番号が11桁を超えると購入できない' do
        @buyer_history_order.phone_number = '080123456789'
        @buyer_history_order.valid?
        expect(@buyer_history_order.errors.full_messages).to include("Phone number is invalid")
      end

      it '電話番号が10桁未満だと購入できない' do
        @buyer_history_order.phone_number = '080123456'
        @buyer_history_order.valid?
        expect(@buyer_history_order.errors.full_messages).to include("Phone number is invalid")
      end

      it 'user_idが無い場合は購入できない' do
        @buyer_history_order.user_id = nil
        @buyer_history_order.valid?
        expect(@buyer_history_order.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが無い場合は購入できない' do
        @buyer_history_order.item_id = nil
        @buyer_history_order.valid?
        expect(@buyer_history_order.errors.full_messages).to include("Item can't be blank")
      end
    end 
  end
end
