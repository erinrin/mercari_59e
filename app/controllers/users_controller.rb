class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end 

  def edit
  end

  def plofile
    @user = User.find(params[:id])
  end

  def identification
  end

  def update
    @user = User.find(current_user)
    if @user.update(user_params)
      redirect_to user_path
    else
      render :edit
    end
  end

  def sign_up_select
  end

end
