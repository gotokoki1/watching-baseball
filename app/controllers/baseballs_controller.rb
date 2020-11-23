class BaseballsController < ApplicationController
  before_action :set_baseball, only: [:show, :edit, :update]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  
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
    @comment = Comment.new
    @comments = @baseball.comments.includes(:user)
  end

  def edit
  end

  def update
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

  def set_baseball
     @baseball = Baseball.find(params[:id])
  end

  def move_to_index
    unless current_user == @baseball.user
    redirect_to root_path 
    end
  end

end
