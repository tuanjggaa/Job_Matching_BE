class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :authenticate_user!
  
  def after_sign_in_path_for(resource)
    if current_user.company?
      company_profile_path(current_user.company)
    elsif current_user.student?
      student_job_board_path
    else
      users_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email])
  end

end
