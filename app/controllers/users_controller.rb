class UsersController < ApplicationController
  before_action :find_user, only: %i[edit update destroy]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @channels = @user.channels
    @notification_channel_ids = current_user.notification_channels.pluck(:id)
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
        format.html { redirect_to users_path, notice: 'User was successfully created.' }
        format.json { render :'users/index', status: :created, location: users_path }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to users_path, notice: 'User updated successfully.'
    else
      redirect_to users_path, notice: 'Error updating user.'
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice: 'User deleted successfully.'
  end
  
  def add_to_channel
    channel_id = params[:user][:channel_ids]
    user_id = params[:user][:user_id]
    @channel_user = ChannelsUsers.new(channel_id: channel_id, user_id: user_id)
    if @channel_user.save
      redirect_to user_path(user_id), notice: 'User added to room'
    else
      if channel_id.blank?
        redirect_to user_path(user_id), alert: 'Please select room.'
      else
        redirect_to user_path(user_id), alert: 'User is already in this room'
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
    params.require(:user).permit(:name, :email, :password, :confirm_password, :skype, :firstname, :lastname,
                                 :notice, :dob, :twitter, :instagram, :facebook, :phone, :mobile)
  end
end
