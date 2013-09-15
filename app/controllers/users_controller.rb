class UsersController < ApplicationController

  def index
    @users = User.all
    respond_with_users :ok, @users
  end

  def show
    @user = User.find(params[:id])
    respond_with_users :ok, @user
  end

  def new
    @user = User.new
    respond_with_users :ok, @user
  end

  def edit
    @user = User.find(params[:id])
    respond_with_users :ok, @user
  end

  def create
    @user = User.create(params[:user].merge(role: 'user'))
    respond_with_users :created, @user, users_path(@user)
  end

  def update
    @user = User.find(params[:id])
    respond_with_users :accepted, @user
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_with_nothing :no_content
  end

  private

  def respond_with_users(status, users, location = nil, notice = nil)
    respond_with users,
                 status: status,
                 location: location,
                 notice: notice
  end
end
