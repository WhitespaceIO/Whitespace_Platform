class PhasesController < ApplicationController
  before_filter :find_project, :only => [:show]
  before_filter :find_phase, :only => [:show]

  def show
    @idea = Idea.new
    @comment = Comment.new
    @resource = Resource.new
    respond_with @phase
  end

  private

  def find_project
    if params.has_key?(:project_id)
      @project = Project.find(params[:project_id])
    end
  end

  def find_phase
    if params.has_key?(:phase_id)
      @phase = @project.phases.where(:type => params[:phase_id].capitalize).first
    else
      @phase = Phase.where('id =? OR type = ?', params[:id], params[:id].capitalize).first
    end
  end

  def respond_with_phases(status, phases, location = nil, notice = nil)
    respond_with phases,
                 status: status,
                 location: location,
                 notice: notice
  end
end
