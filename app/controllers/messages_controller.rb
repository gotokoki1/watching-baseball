class MessagesController < ApplicationController

  def create
    @room = Room.find(params[:message][:room_id])
    @message = Message.new
    @message = Message.find_by(params[:id])
      if Entry.where(user_id: current_user.id, room_id: @room.id)
        @message = Message.create(message_params)
        redirect_to "/rooms/#{@message.room_id}"
      else
        redirect_back(fallback_location: root_path)
      end
  end

  def destroy
    message = Message.find(params[:id])
    if message.user_id == current_user.id
      message.destroy
      redirect_back(fallback_location: root_path)
    end
  end

  private
  def message_params
    params.require(:message).permit(:user_id, :message, :room_id).merge(user_id: current_user.id)
  end
end

