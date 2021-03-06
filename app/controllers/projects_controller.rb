class ProjectsController < ApplicationController
  skip_after_action :verify_policy_scoped, :only => :index
  def index
    @projects = current_user.projects.includes(:payments)
  end

  def show
    @project = Projects.find(params[:id]).includes(:payments)
    authorize @project
  end

  def new
    @project = Project.new
    authorize @project
  end

  def create
    @project = Project.new(project_params)
    authorize @project
    if @project.save
      redirect_to new_payment_path
    else
      render :new
    end
  end


  private

  def project_params
    params.require(:project).permit(:name, :description, :client_id)
  end
end
