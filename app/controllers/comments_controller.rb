class CommentsController < ApplicationController
  before_filter :find_comment, :only => [:vote_up, :vote_down]
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

  def vote_up
    current_user.vote_for(@comment)
    respond_with_comments :accepted, @comment, nil, 'Comment voted up.', 'comments/vote'
  end

  def vote_down
    current_user.vote_against(@comment)
    respond_with_comments :accepted, @comment, nil, 'Comment voted down.', 'comments/vote'
  end

  private

  def find_comment
    @comment = Comment.find(params[:id])
  end

  def find_project
    @project = Project.find(params[:project_id]) if params.has_key? :project_id
  end

  def find_phase
    @phase = Phase.find(params[:phase_id]) if params.has_key? :phase_id
  end

  def find_idea
    @idea = Idea.find(params[:idea_id]) if params.has_key? :idea_id
  end

  def respond_with_comments(status, comments, location = nil, notice = nil, template = nil)
    respond_with comments,
                 status: status,
                 location: location,
                 notice: notice,
                 template: template
  end
end