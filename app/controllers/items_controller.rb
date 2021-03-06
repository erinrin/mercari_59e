class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :destroy, :purchase, :pay]
  def index
    @items = Item.all.order(created_at: :desc).limit(10)
  end

  def new
    if user_signed_in?
    @item = current_user.items.new
    @item.images.build
    @category_parent_array = ["---"]
        Category.where(ancestry: nil).pluck(:name).map{|parent|@category_parent_array << parent}
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save!
      params[:images][:image_url].each do |image|
        @item.images.create!(image: image, item_id: @item.id)
      end
      redirect_to root_path
    else
      redirect_to new_items_path
    end
  end
  
  def show
    @seller = User.find(@item.seller_id)
    @items = @seller.items.order(created_at: :desc).limit(6)
  end
  
  def destroy
    if @item.seller_id == current_user.id
      @item.destroy 
      redirect_to user_path(current_user.id)
    end
  end

  def edit
  
  @item = Item.find(params[:id])
    if user_signed_in? && @item.seller_id == current_user.id
    
    @images = Image.where(item_id: "#{@item.id}")
    @category_parent_array = ["---"]
      Category.where(ancestry: nil).pluck(:name).map{|parent|@category_parent_array << parent}

    else
      redirect_to root_path
    end

  end
  
  def update
    @item = Item.find(params[:id])
    
    if user_signed_in? && @item.seller_id == current_user.id
    
      if params[:images].present?
        params[:images][:image_url].each do |image|
        @item.images.create!(image: image, item_id: @item.id)
        end
      end
      @item = @item.update(update_params)
    
    redirect_to root_path
    else
    redirect_to new_item_path
    end
  end

  def image_delete

  url  = Image.find(params[:id]).item_id
  Image.find(params[:id]).delete
  redirect_to "/items/#{url}/edit"
  end
  
  def search
  end

  def purchase
    if user_signed_in?
      @card = current_user.card
      if @card.present?
        Payjp.api_key =  Rails.application.credentials.PAYJP_PRIVATE_KEY
        customer = Payjp::Customer.retrieve(@card.customer_id)
        @default_card_information = customer.cards.retrieve(@card.card_id)
      end
    else
      redirect_to new_user_session_path
    end
  end


  def pay
    set_item
    
    if @item.seller_id != current_user.id
    card = current_user.card
    Payjp.api_key =  Rails.application.credentials.PAYJP_PRIVATE_KEY
    Payjp::Charge.create(
    :amount => @item.price,
    :customer => card.customer_id, 
    :currency => 'jpy',
  )
    @item.update(buyer_id:current_user.id)
      redirect_to root_path

      else

      redirect_to root_path
    end

  end

  def addnewcard
  end

  def get_category_children
    @category_children = Category.find_by(name: params[:parent_name], ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find(params[:child_id]).children
  end

  private
  def item_params
    params.require(:item).permit(:name, :price, :description, :seller_id, :buyer_id, :quality, :fee, :sendmethod, :senddate, :region, :category_id, images_attributes: [:image]).merge(seller_id: current_user.id)
  end

  def update_params
    params.require(:item).permit(:id,:name, :price, :description, :seller_id, :quality, :fee, :sendmethod, :senddate, :region, :category_id).merge(seller_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end