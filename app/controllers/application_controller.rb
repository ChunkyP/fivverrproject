class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :get_admin_notifications
  before_action :check_admin_unread_message
  before_action :update_last_seen_at, if: -> { user_signed_in? && (current_user.last_seen_at.nil? || current_user.last_seen_at < 5.minutes.ago)}
  # Default layout
  layout :layout_by_resource

  def configure_permitted_parameters
    update_attrs = %i[username firstname lastname email skype avatar password password_confirmation
                    current_password is_admin avatar]
    devise_parameter_sanitizer.permit :sign_up, keys: update_attrs
    devise_parameter_sanitizer.permit :account_update, keys: update_attrs
  end

  def get_admin_notifications
    @show_badge = false
    if current_user.present?
      unless current_user.superadmin?
        @admin_notifications = Anotification.includes(:users).order(created_at: :desc)
        @admin_notifications.each do |n|
          unless n.users.include?(current_user)
            @show_badge=true
          end
        end
      end
    end
  end

  def check_admin_unread_message
    @has_unread_mail = 0
    if current_user.present?
      @conversation_ids = current_user.conversations.pluck(:id)
      @has_unread_mail = Nachrichten.where(read: false).where.not(user_id: current_user.id).where("conversation_id in (?) ", @conversation_ids).map(&:conversation).pluck(:id)
    end
  end

  def update_last_seen_at
    current_user.update_attribute(:last_seen_at, Time.current)
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
