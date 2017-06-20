class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  protect_from_forgery with: :exception

before_action :configure_permitted_parameters, if: :devise_controller?

def after_sign_in_path_for(resource)
     new_post_path
  end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :birth_date, :mobile_no, :gender ])
    #devise_parameter_sanitizer.permit(:sign_in, keys: [:username])
    #devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :company_id, :role_id, :start_date, :end_date, :monthly_charge, :notes, :image_id, :active])
  end

end