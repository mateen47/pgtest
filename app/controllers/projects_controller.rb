class ProjectsController < ApplicationController
  load_and_authorize_resource


	def index
    @projects = current_appuser.projects
	end

	def show
    @project = Project.find(params[:id])
    authorize! :read, @project
	end

	def new
    @project = Project.new
	end

	def create
    project = Project.new(project_params)

    users = params["appusers"].map(&:to_i)
    tempusers = Appuser.where(id: users)

    if @project.save 
      @project.appusers << tempusers
      flash[:success] = "#{@project.name.titleize} project created"
      redirect_to projects_path
    else
      flash[:danger] = "you select more users or select less"
      render 'new'
    end
    
	end

	def edit
    @project = Project.find(params[:id])
	end

	def update
    @project = Project.find(params[:id])

    if @project.update(project_params)
      flash[:success] = " #{@project.name} project updated successfully!"
      redirect_to project_path(@project)
    else
      render 'edit'
    end
	end

	def destroy
    @project = Project.find(params[:id])
    @project.destroy
    flash[:success] = "User #{@project.name} Project deleted successfully"

    redirect_to projects_path
	end

  private

    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:name, :description)
    end

end