class ResourcesController < ApplicationController
  respond_to :json, :xml, :js, :html

  before_filter :find_phase, :only => [:create]
  #before_filter :find_idea, :only => [:create]
  before_filter :find_resource, :only => [:show, :vote_up, :vote_down]

  def index
    @resources = Resource.all
    respond_with_resources :ok, @resources
  end

  def show
    respond_with_projects :ok, @resource
  end

  def create
    if params.has_key?(:url)
      url = params[:url]
    elsif params.has_key?(:resource) && params[:resource].has_key?(:url)
      url = params[:resource][:url]
    end
    if url_exists?(url)
      @resource = Resource.where(:url => url).first
      if @resource.nil?
        @resource = Resource.new({:url => url}.merge(user: current_user))
        if params.has_key?(:name)
          name = params[:name]
        elsif params.has_key?(:resource) && params[:resource].has_key?(:name)
          name = params[:resource][:name]
        end
        if name.blank?
          pismo = Pismo::Document.new(url)
          unless pismo.nil?
            @resource.name = pismo.html_title
            @resource.description = pismo.description
            @resource.favicon = pismo.favicon
            unless pismo.tags.nil? || pismo.tags.empty?
              pismo.tags.split(',').each do |tag|
                @resource.tags << Tag.new(name: tag)
              end
            end
          end
        end
        if @resource.save
          respond_with_resources :created, @resource, nil, 'Resource Created', 'resources/create'
        else
          respond_with_errors :unprocessable_entity, @resource.errors
        end
      else
        respond_with_resources :ok, @resource, nil, 'Resource Created', 'resources/create'
      end
    else
      respond_with_error :not_found, url
    end
  end

  def vote_up
    current_user.vote_for(@resource)
    respond_with_resources :accepted, @resource, nil, 'Resource voted up.', 'resources/vote'
  end

  def vote_down
    current_user.vote_against(@resource)
    respond_with_resources :accepted, @resource, nil, 'Resource voted down.', 'resources/vote'
  end

  private

  def find_resource
    @resource = Resource.find(params[:id])
  end

  def find_phase
    if params.has_key? :phase_id
      @phase = Phase.find(params[:phase_id])
    end
  end

  def find_idea
    if params.has_key? :idea_id
      @idea = Idea.find(params[:idea_id])
    end
  end

  def respond_with_resources(status, resources, location = nil, notice = nil, template = nil)
    respond_with resources,
                 status: status,
                 location: location,
                 notice: notice,
                 template: template,
                 methods: [:tag_list]
  end

end