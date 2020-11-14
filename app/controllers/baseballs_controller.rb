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

  def show
    @baseball = Baseball.find(params[:id])
    @comment = Comment.new
    @comments = @baseball.comments.includes(:user)
  end

  def edit
    @baseball = Baseball.find(params[:id])
  end

  def update
    @baseball = Baseball.find(params[:id])
    if @baseball.update(baseball_params)
      redirect_to baseball_path
    else
      render :edit
    end
  end

  def destroy
    baseball = Baseball.find(params[:id])
    baseball.destroy
    redirect_to root_path
  end

  private

  def baseball_params
    params.require(:baseball).permit(:title, :content, :like_team_id, :image).merge(user_id: current_user.id)
  end

end
