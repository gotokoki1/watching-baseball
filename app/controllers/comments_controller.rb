class CommentsController < ApplicationController

  def create
    @baseball = Baseball.find(params[:baseball_id])
    @comment = @baseball.comments.new(comment_params)
    if @comment.save
      render json:{ post: @comment.as_json.merge(nickname: @comment.user.nickname)
    } 
    else
      @comment = Comment.includes(:user)
      render "baseballs/show"
    end
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, baseball_id: params[:baseball_id])
  end
end
