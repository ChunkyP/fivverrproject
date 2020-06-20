class ConversationsController < ApplicationController

  def index
    @users = User.where.not(id: current_user.id)
    @conversations = Conversation.where("sender_id = ? OR receiver_id = ?", current_user.id, current_user.id)
  end

  def create
    if Conversation.between(params[:sender_id], params[:receiver_id]).present?
      @conversation = Conversation.between(params[:sender_id], params[:receiver_id]).first
    else
      @conversation = Conversation.create!(conversation_params)
    end

    redirect_to conversation_nachrichtens_path(@conversation)
  end

  def download_mail_chat
    @messages = Conversation.find(params[:id]).nachrichten.where("nachrichtens.created_at >= ? and nachrichtens.created_at <= ?",params[:start_date],params[:end_date])
    respond_to do |format|
      format.html
      format.csv { send_data @messages.to_csv, filename: "messages-#{Date.today}.csv" }
    end
  end

  private
  def conversation_params
    params.permit(:sender_id, :receiver_id)
  end
end
