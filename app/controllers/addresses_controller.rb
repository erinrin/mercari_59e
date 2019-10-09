class AddressesController < ApplicationController

  def create
  @address = Address.create!(address_params)
  end
  
  def update
  end
  
  private
  
  def address_params
    params.require(:address).permit(:name_first, :name_last, :name_kana_first, :name_kana_last, :post_number, :prefecture, :city, :house_number, :building).merge(user_id: current_user.id)
  end
end


