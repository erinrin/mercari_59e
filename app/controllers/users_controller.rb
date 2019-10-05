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

  def credit
    @card = Card.where(user_id: current_user.id).first
    if @card.blank?
    else
      Payjp.api_key = 'sk_test_7b7f58cde33212631920ea84'
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

end
