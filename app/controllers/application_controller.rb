class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :current_user

   def current_user
      @current_user ||= Appuser.find_by_id(current_appuser.id) if current_appuser
   end
 


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:email,:user_type])
  end

end
