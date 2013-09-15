class PhasesController < ApplicationController
  before_filter :find_project, :only => [:index]
  before_filter :find_phase, :only => [:show]

  def index
    @phases = @project.phases
    @comment = Comment.new
    respond_with @phases
  end

  def show
    @idea = Idea.new
    @comment = Comment.new
    @resource = Resource.new
    respond_with @phase
  end

  private

  def find_project
    @project = Project.find(params[:project_id])
  end

  def find_phase
    @phase = Phase.find(params[:id])
  end

  def respond_with_phases(status, phases, location = nil, notice = nil)
    respond_with phases,
                 status: status,
                 location: location,
                 notice: notice
  end
end
