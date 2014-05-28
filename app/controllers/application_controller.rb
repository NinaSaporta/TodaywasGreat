class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?
  #before_filter :initialize_mailchimp
  
  protected

  def sign_up_if_not_authenticated!
    redirect_to new_user_registration_path unless current_user
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :name, :location ) }
  end

  # def initialize_mailchimp
  #   @mc = Gibbon::API.new("e201544ee220446b4a0d8b17978ae834-us8")
  #   #, :id=>"4e96192c69").listSubscribe(:email_address => self.email, :merge_vars => {'FNAME'=>self.first_name, 'LNAME'=>self.last_name}, :email_type => 'html', :double_optin => false, :update_existing => true, :replace_interests => true, :send_welcome => false )
  # end

end