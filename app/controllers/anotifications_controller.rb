class AnotificationsController < ApplicationController
  before_action :set_admin_notification, only: [:show, :edit, :update, :destroy]

  # GET /admin_notifications
  # GET /admin_notifications.json
  def index
    @admin_notifications = Anotification.all.order(created_at: :desc).includes(:users)
  end

  # GET /admin_notifications/1
  # GET /admin_notifications/1.json
  def show
    unless current_user.superadmin?
      @is_already_notified =  AnotificationsUsers.where(anotification_id: params[:id].to_i, user_id: current_user.id)
      unless @is_already_notified.present?
        @notification = AnotificationsUsers.create(anotification_id: params[:id].to_i, user_id: current_user.id)
      end
    end
  end

  # GET /admin_notifications/new
  def new
    @admin_notification = Anotification.new
  end

  def read_by
    id = params[:id]
    @ready_by = Anotification.find(id).users
  end

  # GET /admin_notifications/1/edit
  def edit
  end

  def mark_read
    unless current_user.superadmin?
      @is_already_notified =  AnotificationsUsers.where(anotification_id: params[:id].to_i, user_id: current_user.id)
      unless @is_already_notified.present?
        @notification = AnotificationsUsers.create(anotification_id: params[:id].to_i, user_id: current_user.id)
      end
    end
    redirect_to anotifications_path
  end

  # POST /admin_notifications
  # POST /admin_notifications.json
  def create
    @admin_notification = Anotification.new(admin_notification_params)
    if @admin_notification.save
      ActionCable.server.broadcast 'anotificationroom_channel', message: render_notification(@notification)
    end
  end

  # PATCH/PUT /admin_notifications/1
  # PATCH/PUT /admin_notifications/1.json
  def update
    respond_to do |format|
      if @admin_notification.update(admin_notification_params)
        format.html { redirect_to @admin_notification, notice: 'Admin notification was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_notification }
      else
        format.html { render :edit }
        format.json { render json: @admin_notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin_notifications/1
  # DELETE /admin_notifications/1.json
  def destroy
    @admin_notification.destroy
    respond_to do |format|
      format.html { redirect_to anotifications_url, notice: 'Admin notification was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_notification
      @admin_notification = Anotification.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_notification_params
      params.require(:anotification).permit(:body)
    end

    def render_notification(notification)
      render(partial: 'broadcast_notification', locals: {notification: notification})
    end
end
