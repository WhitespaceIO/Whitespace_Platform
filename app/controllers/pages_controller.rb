class PagesController < ApplicationController

  def index
     @projects = Project.all
  end

  def about

  end

  def contact

  end

  def help

  end

  def problem

  end
end
