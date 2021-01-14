class UsersController < ApplicationController

  def index 
    users = User.all
    render json: users
  end

  def show
    user = user.find(params[:id])
    render json: user
  end

  def new 
    user = User.new
    render json: user
  end

  def create
    user = User.create!(user_params)
    if user.valid?
      render json: user
    else
      render json: { error: "user was not created, please try again!"}
    end
  end

  def update
    user = User.find(params[:id])
    user.update!(user_params)
    render json: user
  end

  def destroy
    user = User.find(params[:id])
    user.destroy!
    render json: {}
  end

  private

  def user_params 
    params.permit(:username, :password, :name, :img)
  end
end
