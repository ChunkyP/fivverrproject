class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  # Default layout
  layout :layout_by_resource

  private

  def layout_by_resource
    if devise_controller?
      "main/layout-blank"
    else
      'main/layout-2'
    end
  end
end
