class AddressesController < ApplicationController
  def create
    @address = Address.create!(address_params)
    if request.referrer.match("addregion")
      redirect_to addnewcard_item_path(current_user.id)
    else
      redirect_to identification_user_path(current_user.id)
    end
  end
  
  def update
    @address = Address.find(params[:id])
    if user_signed_in? && @address.user_id == current_user.id    
      @address = @address.update(address_params)
      redirect_to identification_user_path(current_user.id)
    else
      redirect_to identification_user_path(current_user.id)
    end
  end
  
  def addregion
    @address = Address.new
  end

  private
  
  def address_params
    params.require(:address).permit(:name_first, :name_last, :name_kana_first, :name_kana_last, :post_number, :prefecture, :city, :house_number, :phone_number, :building).merge(user_id: current_user.id)
  end
end


