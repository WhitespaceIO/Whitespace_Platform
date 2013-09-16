class ResourcesController < ApplicationController
  before_filter :find_phase, :only => [:create]
  before_filter :find_resource, :only => [:vote_up, :vote_down]

  def create
    @resource = @phase.resources.create!(params[:resource].merge(user: current_user))
    respond_with_resources :created,
                          @resource,
                          project_phase_resource_path(@phase.project, @phase, @resource),
                          'Resource created.'
  end

  def vote_up
    current_user.vote_for(@resource)
    respond_with_resources :ok, @resource
  end

  def vote_down
    current_user.vote_against(@resource)
    respond_with_resources :ok, @resource
  end

  private

  def find_resource
    @resource = Resource.find(params[:id])
  end

  def find_phase
    @phase = Phase.find(params[:phase_id])
  end

  def respond_with_resources(status, resources, location = nil, notice = nil)
    respond_with resources,
                 status: status,
                 location: location,
                 notice: notice
  end

end
