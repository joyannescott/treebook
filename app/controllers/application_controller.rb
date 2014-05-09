class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

before_filter :configure_permitted_parameters, if: :devise_controller?

   protected
   # Devise using strong parameters . (lazy way!)
   def configure_permitted_parameters
     devise_parameter_sanitizer.for(:sign_up)  { |u| u.permit(:first_name,:last_name,:profile_name,:email, :password) }
     devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name,:last_name,:profile_name,:email, :password) }
     devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name,:last_name,:profile_name,:email, :password) }
   end
   def profiles_params
      params.require(user).permit(:user_id, :friend_id, :users, :friend, :state, :first_name, :last_name, :user_friendship, :full_name, :album, :albums_thumbnail, :title)
  end
 end
