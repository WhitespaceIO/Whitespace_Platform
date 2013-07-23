class PhasesController < ApplicationController
  before_filter :find_project, :only => [:index]
  before_filter :find_phase, :only => [:show]

  def index
    @phases = @project.phases
  end

  def show
  end

  private

  def find_project
    @project = Project.find(params[:project_id])
  end

  def find_phase
    @phase = Phase.find(params[:id])
  end
end
