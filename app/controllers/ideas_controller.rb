class IdeasController < ApplicationController
  before_filter :find_project, :only => [:show, :create]
  before_filter :find_phase, :only => [:show, :create]
  before_filter :find_idea, :only => [:show, :edit, :update, :destroy, :vote_up, :vote_down]

  def show
    @comment = Comment.new
    respond_with @idea
  end

  def new
    @idea = Idea.new
    @idea.phase = @phase
    @idea.resources.build
    respond_with_ideas :ok, @idea
  end

  def edit
    respond_with_ideas :ok, @idea
  end

  def create
    logger.info "Params #{params.inspect}"
    if params[:idea].has_key?(:resources)
      resources = []
      if params[:idea][:resources][:id].present?
        resources << Resource.find(params[:idea][:resources][:id])
      elsif params[:idea][:resources][:name].present? && params[:idea][:resources][:url].present?
        resources << Resource.create!(name: params[:idea][:resources][:name],
                                      url: params[:idea][:resources][:url])
      end
      logger.info "Resources #{resources}"
      params[:idea].delete(:resources)
    end
    @idea = @phase.ideas.create(params[:idea].merge(user: current_user).merge(resources: resources))
    logger.info "Idea #{@idea.inspect}"
    respond_with_ideas :created,
                       @idea,
                       request.referer || project_phase_path(@project, @phase),
                       'Idea was successfully created.'
  end

  def update
    @idea.update_attributes!(params[:idea])
    respond_with_ideas :created, @idea, nil, 'Idea was successfully updated.'
  end

  def destroy
    @idea.destroy
    respond_with_nothing :no_content
  end

  def vote_up
    current_user.vote_for(@idea)
    respond_with_ideas :accepted, @idea, nil, 'Idea voted up.', 'ideas/vote'
  end

  def vote_down
    current_user.vote_against(@idea)
    respond_with_ideas :accepted, @idea, nil, 'Idea voted down.', 'ideas/vote'
  end

  private

  def find_project
    if params.has_key? :project_id
      @project = Project.find(params[:project_id])
    end
  end

  def find_phase
    if params.has_key?(:project_id)
      @phase = @project.phases.where(:type => params[:phase_id].capitalize).first
    elsif params.has_key?(:phase_id)
      @phase = Phase.where('id =? OR type = ?', params[:phase_id], params[:phase_id].capitalize).first
    end
  end

  def find_idea
    if params.has_key? :idea_id
      @idea = Idea.find(params[:idea_id])
    else
      @idea = Idea.find(params[:id])
    end
  end

  def respond_with_ideas(status, ideas, location = nil, notice = nil, template = nil)
    respond_with ideas,
                 status: status,
                 location: location,
                 notice: notice,
                 template: template
  end

end
