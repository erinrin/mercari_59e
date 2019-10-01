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

  def purchase
    @item = Item.find(params[:id])

  end



  def pay
    item = Item.where(buyitem_params).first
    
    if item != current_user.id
    

    Payjp.api_key = 'sk_test_7b7f58cde33212631920ea84'
    charge = Payjp::Charge.create(
    :amount => item.price,
    :card => params['payjp-token'],
    :currency => 'jpy',
  )
  item.update(buyer_id:current_user.id)

    else
    redirect_to root_path
    end

  end

  private

  def buyitem_params
  params.permit(:id)
  
  end

end