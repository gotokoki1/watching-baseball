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
    @baseball = Baseball.find(params[:baseball_id])
    @comment = @baseball.comments.find(params[:id])
    if current_user == @comment.user
      @comment.destroy
      render json: true
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, baseball_id: params[:baseball_id])
  end
end
