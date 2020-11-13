class CommentsController < ApplicationController

  def create
    @baseball = Baseball.find(params[:baseball_id])
    @comment = @baseball.comments.new(comment_params)
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, baseball_id: params[:baseball_id])
  end
end