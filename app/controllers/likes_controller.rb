class LikesController < ApplicationController
  before_action :baseball_set, only: [:create, :destroy]
  def create
    like = current_user.likes.new(baseball_id: params[:baseball_id])
    if like.save
      respond_to do |format|
        format.js
      end
    end
  end

  def destroy
    current_user.likes.find_by(baseball: @baseball).destroy
    respond_to do |format|
      format.js
    end
  end

  private

  def baseball_set
    @baseball = Baseball.find(params[:baseball_id])
  end
end
