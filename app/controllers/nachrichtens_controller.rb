class NachrichtensController < ApplicationController

  before_action do
    @conversation = Conversation.find(params[:conversation_id])
  end

  def index
    @nachrichtens = @conversation.nachrichten
    @nachrichtens.where.not(user_id: current_user.id).update_all(read: true)

    @nachrichten = @conversation.nachrichten.new
    @action = "converstation_index"
  end

  def create
    @nachrichten = @conversation.nachrichten.new(nachrichten_params)
    @nachrichten.user = current_user

    if @nachrichten.save
      redirect_to conversation_nachrichtens_path(@conversation)
    end
  end

  private
  def nachrichten_params
    params.require(:nachrichten).permit(:body, :user_id)
  end

end
