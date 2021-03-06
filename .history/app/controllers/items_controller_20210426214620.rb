class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search]

  
  def index
    @items = Item.all.order('created_at DESC')
  end
end
