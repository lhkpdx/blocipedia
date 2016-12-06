class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  protect_from_forgery with: :exception
  after_filter :store_action
  before_action :configure_permitted_parameters, if: :devise_controller?

  def store_action
    return unless request.get?
      if (request.path != "/users/sign_in" &&
          request.path != "/users/sign_up" &&
          request.path != "/users/password/new" &&
          request.path != "/users/password/edit" &&
          request.path != "/users/confirmation" &&
          request.path != "/users/sign_out" &&
          !request.xhr?) # don't store ajax calls
        store_location_for(:user, welcome_index_path)
      end
    end

   def after_sign_out_path_for(resource_or_scope)
     new_user_session_path
   end


  private

    def configure_permitted_parameters
       devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
    end


   def require_sign_in
     unless current_user
       flash[:alert] = "You must be logged in to do that"
       redirect_to new_user_session_path
     end
   end

end
