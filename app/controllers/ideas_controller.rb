class IdeasController < ApplicationController
  before_filter :find_project, :only => [:index, :create]
  before_filter :find_phase, :only => [:index, :create]

  def index
    @ideas = @phase.ideas
    respond_with_ideas :ok, @ideas
  end

  def show
    @idea = Idea.find(params[:id])
    @comment = Comment.new
    respond_with_ideas :ok, @idea
  end

  def new
    @idea = Idea.new
    @idea.phase = @phase
    respond_with_ideas :ok, @idea
  end

  def edit
    @idea = Idea.find(params[:id])
    respond_with_ideas :ok, @idea
  end

  def create
    logger.info "Params #{params.inspect}"
    @idea = @phase.ideas.create (params[:idea].merge(user: current_user))
    respond_with_ideas :created,
                           @idea,
                           project_phase_path(@idea.phase.project, @idea.phase),
                           'Proposal was successfully created.'
  end

  def update
    @idea = Idea.find(params[:id])
    @idea.update_attributes!(params[:idea])
    respond_with_ideas :created, @idea, nil, 'Proposal was successfully updated.'
  end

  def destroy
    @idea = Idea.find(params[:id])
    @idea.destroy
    respond_with_nothing :no_content
  end

  private

  def find_project
    @project = Project.find(params[:project_id])
  end

  def find_phase
    @phase = Phase.find(params[:phase_id])
  end

  def respond_with_ideas(status, ideas, location = nil, notice = nil)
    respond_with ideas,
                 status: status,
                 location: location,
                 notice: notice
  end

end
