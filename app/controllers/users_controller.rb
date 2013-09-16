class UsersController < ApplicationController

  def index
    @users = User.all
    respond_with_users :ok, @users
  end

  def show
    @user = User.find(params[:id])
    respond_with_users :ok, @user
  end

  private

  def respond_with_users(status, users, location = nil, notice = nil)
    respond_with users,
                 status: status,
                 location: location,
                 notice: notice
  end
end
