class Api::V1::ChatsController < ApplicationController
  def index
    chats = get_current_user.chats
    render json: chats
  end

  def show
    chat = Chat.find(params[:id])

    render json: chat
  end

  private

    def chat_params
      params.require(:chat).permit(:id)
    end
end
