class ItemsController < ApplicationController
 def index
 end
 def search
 end
 def new
  redirect_to new_user_session_path unless user_signed_in?
  @item = Item.new
 end
end
