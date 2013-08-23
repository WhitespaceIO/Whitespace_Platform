class UsersController < ApplicationController

  def index
    @users = User.all
    respond_with @users
  end

  def show
    @user = User.find(params[:id])
    respond_with @user
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    respond_with(@user, :location => users_url) do |format|
      format.html { redirect_to user_path }
    end
  end

  def update
    @user = User.find(params[:id])
    respond_with @user
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.any(:xml, :json) { head :no_content }
    end
  end
end
