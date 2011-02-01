class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :admin?

  def admin?
    session[:password] == APP_CONFIG['password']
  end
  
private
  def authenticate
    unless admin?
      flash[:notice] = "Sorry bub, you'll have to Jedi mind trick your way in."
      redirect_to root_path
      false
    end
  end
end