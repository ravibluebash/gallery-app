class RegistrationsControllerController < ApplicationController

    # private
 
    # # Modified Devise params for user login
    # def sign_up_params
    #   params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    # end
    
    def after_sign_up_path_for(resource)
        "/admin"
    end   
    def after_inactive_sign_up_path_for(resource)
        "registrations/new" #redirect to sign in correctly 
    end
end
