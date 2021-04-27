class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @item = Item.find(params[:id])
  end
end
