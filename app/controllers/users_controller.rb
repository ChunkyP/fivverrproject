class UsersController < ApplicationController
  before_action :find_user, only: %i[edit update destroy]

  def index
    @users = User.all
    @users_admin = User.where(is_admin: true)
  end

  def show
    @user = User.find(params[:id])
    @channels = @user.channels
    @notification_channel_ids = current_user.notification_channels.pluck(:channel_id)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to users_path, notice: 'Benutzer erfolgreich geändert.'
    else
      redirect_to users_path, notice: 'Fehler bei den Änderungen.'
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice: 'Benutzer erfolgreich gelöscht.'
  end

# GET /users/new
  def new
    @user = User.new
  end

# POST /users
# POST /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save(:validate => false)
        format.html { redirect_to @user, notice: 'Benutzer erfolgreich erstellt.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def add_to_channel
    channel_id = params[:user][:channel_ids]
    user_id = params[:user][:user_id]
    @channel_user = ChannelsUsers.new(channel_id: channel_id, user_id: user_id)
    if @channel_user.save
      redirect_to user_path(user_id), notice: 'Benutzer hinzugefügt'
    else
      if channel_id.blank?
        redirect_to user_path(user_id), alert: 'Bitte einen Chat wählen.'
      else
        redirect_to user_path(user_id), alert: 'Benutzer diesem Chat bereits zugewiesen.'
      end
    end
  end

  def make_notification
    user_id = params[:user_id]
    channel_id = params[:channel_id]
    notification = ChannelsUsers.where(user_id: user_id, channel_id: channel_id)
    msg = if notification.update(read: false)
            'success'
          else
            'failure'
          end
    respond_to do |format|
      format.json { render json: msg.to_json }
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :confirm_password, :skype, :firstname, :lastname,
                                 :notice, :dob, :twitter, :instagram, :facebook, :phone, :mobile, :avatar)
  end
end
