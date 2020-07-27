
class RegistrationsController < ApplicationController
  
  def new
    @appuser=Appuser.new
  end

  def create
    @user = Appuser.new(user_params.tap{ |u| u[:user_type] = u[:user_type].to_i })
    user_t=params[:user_type].to_i
    @user.user_type=user_t
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome #{@user.name} MyRecipe app"
      redirect_to root_path
    else
      render 'new'
    end
  end


    private

    def user_params
      params.require(:appuser).permit(:name, :email, :password, :password_confirmation, :user_type)
    end

end