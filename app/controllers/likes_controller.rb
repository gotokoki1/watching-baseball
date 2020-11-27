class LikesController < ApplicationController
  def create
    @baseball = Baseball.find(params[:baseball_id])
    @like = current_user.likes.new(baseball_id: params[:baseball_id])
    @like.save
    # redirect_back(fallback_location: root_path)
    # @likes = Like.where(baseball_id: @baseball.id)
  end

  def destroy
    @bseeball = Baseball.find(params[:baseball_id])
    @like = Like.find_by(baseball_id: params[:baseball_id], user_id: current_user.id)
    @like.destroy
    # redirect_back(fallback_location: root_path)
    # @likes = Like.where(baseball_id: @baseball.id)
  end
end
