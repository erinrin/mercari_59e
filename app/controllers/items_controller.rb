class ItemsController < ApplicationController

  def index
  end

  
  def new
    redirect_to new_user_session_path unless user_signed_in?
    @item = current_user.items.new
  end
  
  def create
    @item = Item.create
  end
  
  def show
    @item = Item.find(params[:id])
    @seller = User.find_by(id: @item.seller_id)
    @sellerName = @seller.nickname
  end
  
  def edit
  end
  
  def update
  end
  
  def search
  end

end