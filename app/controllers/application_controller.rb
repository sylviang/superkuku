class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :miniprofiler
  before_filter :configure_permitted_parameters, if: :devise_controller?
  
  private
  def miniprofiler
    # required only in production
    #if is_admin?
      Rack::MiniProfiler.authorize_request
    #end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation) }
  	devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :current_password, :password, :password_confirmation) }
  end

  def show_video(url)
    render :partial => 'shared/video', :locals => { :url => url }
  end

end