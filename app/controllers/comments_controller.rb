class CommentsController < ApplicationController
  before_filter :find_project, :only => [:create]
  before_filter :find_phase, :only => [:create]
  before_filter :find_idea, :only => [:create]

  def create
    logger.info "Params #{params.inspect}"
    #TODO replace if-else block with logic to use commentable
    if !@idea.nil?
      @comment = @idea.comments.create(params[:comment].merge(:user => current_user))
      respond_with_comments :created,
                            @comment,
                            project_phase_idea_path(@idea.phase.project, @idea.phase, @idea),
                            'Proposal comment created.'
    elsif !@phase.nil?
      @comment = @phase.comments.create(params[:comment].merge(:user => current_user))
      respond_with_comments :created,
                            @comment,
                            project_phase_path(@phase.project, @phase),
                            'Phase comment created.'
    elsif !@project.nil?
      @comment = @project.comments.create(params[:comment].merge(:user => current_user))
      respond_with_comments :created,
                            @comment,
                            project_path(@project),
                            'Project comment created.'
    end
  end

  private

  def find_project
    @project = Project.find(params[:project_id]) if params.has_key? :project_id
  end

  def find_phase
    @phase = Phase.find(params[:phase_id]) if params.has_key? :phase_id
  end

  def find_idea
    @idea = Idea.find(params[:idea_id]) if params.has_key? :idea_id
  end

  def respond_with_comments(status, comments, location = nil, notice = nil)
    respond_with comments,
                 status: status,
                 location: location,
                 notice: notice
  end
end