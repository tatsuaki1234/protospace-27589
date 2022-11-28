class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile, :occupation, :position])
  end
end



# new_user_registration
# configure_permitted_parameters
# [:name, :profile, :occupation, :position]

 # def new
#   @user = User.new
#   configure_permitted_parameters
# end

# def create
#   configure_permitted_parameters
# end


