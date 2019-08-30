
class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    protect_from_forgery
  
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) do |user_params|
            user_params.permit({ roles: [] }, :email, :password, :password_confirmation)
        end
    end

    def set_layout
      layout 'devise'
    end

    private 
    def after_sign_in_path_for(resource)
        "/admin/"
    end
end