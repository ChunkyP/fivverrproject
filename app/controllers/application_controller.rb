class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  # Default layout
  layout :layout_by_resource

  def configure_permitted_parameters
    update_attrs = [:username, :firstname, :lastname, :email, :skype, :avatar, :password, :password_confirmation,
                    :current_password, :is_admin, :avatar]
    devise_parameter_sanitizer.permit :sign_up, keys: update_attrs
    devise_parameter_sanitizer.permit :account_update, keys: update_attrs
  end

  private

  def layout_by_resource
    if devise_controller? and params[:action] != "edit"
      "main/layout-blank"
    else
      'main/layout-2'
    end
  end
end
