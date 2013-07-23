class MembersController < ApplicationController

  def index
    @members = Member.all
    respond_with @members
  end

  def show
    @member = Member.find(params[:id])
    respond_with @member
  end

  def new
    @member = Member.new
  end

  def edit
    @member = Member.find(params[:id])
  end

  def create
    @member = Member.new(params[:member])
    respond_with(@member, :location => members_url) do |format|
      format.html { redirect_to member_path }
    end
  end

  def update
    @member = Member.find(params[:id])
    respond_with @member
  end

  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    respond_to do |format|
      format.html { redirect_to members_url }
      format.any(:xml, :json) { head :no_content }
    end
  end
end
