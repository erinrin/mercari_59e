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
    @user = User.find(params[:id])
    if @user.address == nil
      @address = @user.build_address
    else
      @address = @user.address
    end
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path
    else
      render :plofile
    end
  end

  def sign_up_select
  end

  def addphone
  end

  def nextphone
  end
  
  def credit
    @card = current_user.card

    if @card.present?
      Payjp.api_key = Rails.application.credentials.PAYJP_PRIVATE_KEY
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

end
