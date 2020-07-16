class MessagesController < ApplicationController
  before_action :find_channel, only: %i[index create]


  def show_archive
    @messages = Message.all
  end

  # GET /messages
  # GET /messages.json
  def index
    channels_ids = current_user.channels.pluck(:id)
    unless channels_ids.include? params[:channel_id].to_i
      redirect_to root_path, alert: 'Zugriff verweigert.'
    end
    @messages = @channel.messages.order('created_at asc')
    @message = Message.new
    @channels = current_user.channels
    channel_user = ChannelsUsers.where(user_id: current_user.id, channel_id: params[:channel_id])
    channel_user.update(read: true)
    @notification_channel_ids = current_user.notification_channels.pluck(:channel_id)
  end

  # GET /messages/1
  # GET /messages/1.json
  def show; end

  # POST /messages
  # POST /messages.json
  def create
    @message = @channel.messages.build(message_params)
    @message.user = current_user
    if message_params[:avatar].present?
      @message.msg_type = 1
    end
    if @message.save
      ActionCable.server.broadcast 'chatroom_channel', message: render_message(@message)
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def find_channel
    @channel = Channel.find(params[:channel_id])
  end

  # Only allow a list of trusted parameters through.
  def message_params
    params.require(:message).permit(:message, :avatar)
  end

  def render_message(message)
    render(partial: 'broadcast_message', locals: {message: message})
  end
end
