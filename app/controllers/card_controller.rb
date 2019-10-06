class CardController < ApplicationController
  require "payjp"


  def pay 
    Payjp.api_key = 'sk_test_7b7f58cde33212631920ea84'

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
      Payjp.api_key = 'sk_test_7b7f58cde33212631920ea84'
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to controller:"users",action: "credit"
  end

end
