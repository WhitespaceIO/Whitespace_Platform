class ProjectsController < ApplicationController

  def index
    @projects = Project.all
    respond_with_projects :ok, @projects
  end

  def show
    @project = Project.find(params[:id])
    @comment = Comment.new
    respond_with_projects :ok, @project
  end

  def new
    @project = Project.new
    respond_with_projects :ok, @project
  end

  def edit
    @project = Project.find(params[:id])
    respond_with_projects :ok, @project
  end

  def create
    @project = Project.new(params[:project])
    respond_with_projects :created, @project, projects_path(@project), 'Project was successfully created.'
  end

  def update
    @project = Project.find(params[:id])
    @project.update_attributes!(params[:project])
    respond_with_projects :accepted, @project, @project, 'Project was successfully updated.'
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    respond_with_nothing :no_content
  end

  private

  def respond_with_projects(status, projects, location = nil, notice = nil)
    respond_with projects,
                 status: status,
                 location: location,
                 notice: notice
  end

end
