class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end 

  def sign_up_select
  end

end
