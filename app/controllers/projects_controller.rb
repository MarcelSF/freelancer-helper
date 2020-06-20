class ProjectsController < ApplicationController
  def new
  end

  def index
    @projects = current_user.projects.includes(:payments)
    authorize @projects
  end
end
