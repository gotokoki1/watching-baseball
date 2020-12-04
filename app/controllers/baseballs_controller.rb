class BaseballsController < ApplicationController
  before_action :set_baseball, only: [:show, :edit, :update]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  
  def index
    @baseball = Baseball.includes(:user)
    @baseballs = Baseball.page(params[:page]).per(5).order('updated_at DESC')
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
    @like_users = @baseball.like_users
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
end
