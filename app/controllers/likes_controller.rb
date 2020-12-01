class LikesController < ApplicationController
  def create
    @baseball = Baseball.find(params[:baseball_id])
    like = current_user.likes.new(baseball_id: params[:baseball_id])
    if like.save
      respond_to do |format|
        format.js
      end
    end
  end

  def destroy
    @baseball = Baseball.find(params[:baseball_id])
    current_user.likes.find_by(baseball: @baseball).destroy
    respond_to do |format|
      format.js
    end
  end
end
