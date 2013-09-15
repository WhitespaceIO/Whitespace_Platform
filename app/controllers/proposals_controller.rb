class ProposalsController < ApplicationController
  before_filter :find_project, :only => [:index, :create]
  before_filter :find_phase, :only => [:index, :create]

  def index
    @proposals = @phase.proposals
    respond_with_proposals :ok, @proposals
  end

  def show
    @proposal = Proposal.find(params[:id])
    @comment = Comment.new
    respond_with_proposals :ok, @proposal
  end

  def new
    @proposal = Proposal.new
    @proposal.phase = @phase
    respond_with_proposals :ok, @proposal
  end

  def edit
    @proposal = Proposal.find(params[:id])
    respond_with_proposals :ok, @proposal
  end

  def create
    logger.info "Params #{params.inspect}"
    @proposal = @phase.proposals.create (params[:proposal].merge(user: current_user))
    respond_with_proposals :created,
                           @proposal,
                           project_phase_path(@proposal.phase.project, @proposal.phase),
                           'Proposal was successfully created.'
  end

  def update
    @proposal = Proposal.find(params[:id])
    @proposal.update_attributes!(params[:proposal])
    respond_with_proposals :created, @proposal, nil, 'Proposal was successfully updated.'
  end

  def destroy
    @proposal = Proposal.find(params[:id])
    @proposal.destroy
    respond_with_nothing :no_content
  end

  private

  def find_project
    @project = Project.find(params[:project_id])
  end

  def find_phase
    @phase = Phase.find(params[:phase_id])
  end

  def respond_with_proposals(status, proposals, location = nil, notice = nil)
    respond_with proposals,
                 status: status,
                 location: location,
                 notice: notice
  end

end
