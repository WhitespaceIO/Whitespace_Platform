class ProjectsController < ApplicationController
  before_filter :find_project, :only => [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
    respond_with_projects :ok, @projects
  end

  def show
    @comment = Comment.new
    respond_with_projects :ok, @project
  end

  def new
    respond_with_projects :ok, @project
  end

  def edit
    respond_with_projects :ok, @project
  end

  def create
    @project = Project.create!(params[:project])
    respond_with_projects :created, @project, project_path(@project), 'Project was successfully created.'
  end

  def update
    @project.update_attributes!(params[:project])
    respond_with_projects :accepted, @project, @project, 'Project was successfully updated.'
  end

  def destroy
    @project.destroy
    respond_with_nothing :no_content
  end

  private

  def find_project
    @project = Project.find(params[:id])
  end

  def respond_with_projects(status, projects, location = nil, notice = nil)
    respond_with projects,
                 status: status,
                 location: location,
                 notice: notice
  end

end
