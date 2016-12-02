class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  after_filter :store_action

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

      def after_sign_out_path_for(resource_or_scope)
        new_user_session_path
      end
    end





  private

   def require_sign_in
     unless current_user
       flash[:alert] = "You must be logged in to do that"
       redirect_to new_user_session_path
     end
   end

end
