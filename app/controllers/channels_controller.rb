class ChannelsController < ApplicationController
  before_action :set_channel, only: %i[add_new_user show edit update destroy]

  # GET /channels
  # GET /channels.json
  def index
    @channels = Channel.all
    @notification_channel_ids = current_user.notification_channels.pluck(:channel_id)
  end

  # GET /channels/1
  # GET /channels/1.json
  def show
    id = params[:id]
    @users = Channel.find(id).users
  end

  # GET /channels/new
  def new
    @channel = Channel.new
  end

  # GET /channels/1/edit
  def edit; end

  # POST /channels
  # POST /channels.json
  def create
    @channel = Channel.new(channel_params)

    respond_to do |format|
      if @channel.save
        format.html { redirect_to @channel, notice: 'Channel was successfully created.' }
        format.json { render :show, status: :created, location: @channel }
      else
        format.html { render :new }
        format.json { render json: @channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /channels/1
  # PATCH/PUT /channels/1.json
  def update
    respond_to do |format|
      if @channel.update(channel_params)
        format.html { redirect_to @channel, notice: 'Channel was successfully updated.' }
        format.json { render :show, status: :ok, location: @channel }
      else
        format.html { render :edit }
        format.json { render json: @channel.errors, status: :unprocessable_entity }
      end
    end
  end

  def download_chat
    @messages = Channel.find(params[:id]).messages.where("messages.created_at >= ? and messages.created_at <= ?",params[:start_date],params[:end_date])
    respond_to do |format|
      format.html
      format.csv { send_data @messages.to_csv, filename: "messages-#{Date.today}.csv" }
    end
  end

  # DELETE /channels/1
  # DELETE /channels/1.json
  def destroy
    @channel.destroy
    respond_to do |format|
      format.html { redirect_to channels_url, notice: 'Channel was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_new_user
    @users = User.all
  end

  def remove_user
    @user_channel = ChannelsUsers.where(channel_id: params[:channel_id], user_id: params[:id])
    @user_channel.destroy_all
    redirect_to :back, notice: "User removed Successfully"
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_channel
    @channel = Channel.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def channel_params
    params.require(:channel).permit(:name, :muted)
  end
end
