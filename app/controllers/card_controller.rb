class CardController < ApplicationController
  require "payjp"


  def pay 
    Payjp.api_key =  Rails.application.credentials.PAYJP_PRIVATE_KEY

    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      ) 
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to controller:"users", action: "credit"
      else
        redirect_to action: "pay"
      end
    end
  end


  def delete 
    card = current_user.card
    
    if card.present?
      Payjp.api_key = Rails.application.credentials.PAYJP_PRIVATE_KEY
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to controller:"users",action: "credit"
  end

end
