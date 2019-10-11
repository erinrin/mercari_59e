class Users::RegistrationsController < Devise::RegistrationsController

  def after_sign_up_path_for(resource)
    addphone_user_path(current_user.id)
  end

  def create
    if verify_recaptcha
      super
    else
      self.resource = resource_class.new
      respond_with_navigational(resource) { render :new }
    end
  end
  
end