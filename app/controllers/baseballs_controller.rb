class BaseballsController < ApplicationController
  def index
    @baseball = Baseball.includes(:user)
  end

  def new
    @baseball = Baseball.new
  end

  def create
    @baseball = Baseball.new(baseball_params)
    if @baseball.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def baseball_params
    params.require(:baseball).permit(:title, :content, :like_team_id, :image).merge(user_id: current_user.id)
  end

end
