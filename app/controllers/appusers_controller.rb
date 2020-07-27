class AppusersController < ApplicationController
	load_and_authorize_resource
	
	def index
		@users = Appuser.all
	end

	def edit
		@user = Appuser.find(params[:id])
	end

	def selectproject		
		@user = Appuser.find(params[:user_id])
		if @user.user_type != 'manager'
			@projects = Project.all
		else
			flash[:danger] = "Cannot add manager to this project"
			redirect_to appusers_path
		end
	end

	def addproject
		@project = Project.find(params[:project_id])
		@user = Appuser.find(params[:user_id])
		if !@project.appusers.find_by(user_type: @user.user_type)
			if @user.projects << @project

				flash[:success] = "project successfully added"
				redirect_to appuser_path(@user)
			else
				flash[:danger] = "something wrong with your selection"
				redirect_to appusers_path
			end
		else
			flash[:danger] = "#{@user.user_type} Already added to this project"
			redirect_to appusers_path
		end
	end

	def update
		@user = Appuser.find(params[:id])
		user_t=params[:user_type].to_i
		user=user_params
		user[:user_type]=user_t

		if @user.update(user)
			flash[:success] = " #{@user.name}'s profile updated successfully!"
			redirect_to appuser_path(@user)
		else
			render 'edit'
		end
	end

	def destroy
		@user = Appuser.find(params[:id])
		@user.destroy
		flash[:success] = "User #{@user.name}'s profile deleted successfully"

		redirect_to appusers_path
	end

	def show 
		@user = Appuser.find(params[:id])
	end

	private

		def user_params
			params.require(:appuser).permit(:name, :email, :password, :password_confirmation, :user_type)
		end
end