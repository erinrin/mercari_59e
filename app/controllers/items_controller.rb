class ItemsController < ApplicationController
 def index
 end

 def search
 end

 def new
  redirect_to new_user_session_path unless user_signed_in?
  @item = current_user.items.new
 end

 def create
  @item = Item.create
 end

 def show
 end

 def edit
 end

 def update
 end

end