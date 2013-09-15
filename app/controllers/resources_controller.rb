class ResourcesController < ApplicationController
  before_filter :find_phase, :only => [:create]

  def create
    @resource = @phase.resources.create!(params[:resource].merge(user: current_user))
    respond_with_resources :created,
                          @resource,
                          project_phase_resource_path(@phase.project, @phase, @resource),
                          'Resource created.'
  end

  private

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
