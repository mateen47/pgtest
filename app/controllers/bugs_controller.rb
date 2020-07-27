class BugsController < ApplicationController
  load_and_authorize_resource

  def index
    @bugs=current_appuser.bugs
  end

  def new 
    @bug = Bug.new
    @project = Project.find_by(id: params[:project_id])
  end

  def create
    bug=bug_params
    bug[:deadline]=params[:deadline].to_i
    @bug = Bug.new(bug)
    project = Project.find_by(id: params[:project_id])
    users = params["appusers"].map(&:to_i)
    tempusers = Appuser.where(id: users)
 
    if project.bugs << @bug
      @bug.appusers << tempusers

      flash[:success] = "#{@bug.title.titleize} bug created"
      redirect_to bug_path(@bug)
    else
      flash[:success] = "#{bug} bug not created"
      render 'new'
    end 
  end

  def edit
    @bug = Bug.find(params[:id])
  end

  def update
    @bug = Bug.find(params[:id])

    if @bug.update(bug_params)
      flash[:success] = " #{@bug.bug_type} project updated successfully!"
      redirect_to bug_path(@bug)
    else
      render 'edit'
    end
  end

  def destroy
    @bug = Bug.find(params[:id])
    @bug.destroy
    flash[:success] = "#{@bug.bug_type} deleted successfully"

    redirect_to bugs_path
  end

  def show 
    @bug = Bug.find(params[:id])
    authorize! :read, @bug
  end

  private

    def set_bug
      @bug = Bug.find(params[:id])
    end

    def bug_params
      params.require(:bug).permit(:title, :description, :deadline, :bug_type, :status, :screenshot)
    end

end