class ItemsController < ApplicationController

  def index
  end

  
 def new
  redirect_to new_user_session_path unless user_signed_in?
  @item = current_user.items.new
  @item.images.build
  @category_parent_array = ["---"]
        Category.where(ancestry: nil).each do |parent|
          @category_parent_array << parent.name
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

  def get_category_children
  @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
  @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  private
  def item_params
    params.require(:item).permit(:name, :price, :description, :seller_id, :buyer_id, :quality, :fee, :sendmethod, :senddate, :region, :category_id, images_attributes: [:image]).merge(seller_id: current_user.id)
  end

end