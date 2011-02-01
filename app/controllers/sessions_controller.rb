class SessionsController < ApplicationController
  def create
    session[:password] = params[:password]
      if session[:password] == APP_CONFIG['password']
        flash[:notice] = 'Sucessfully logged in'
        redirect_to root_path
      else
        flash[:notice] = 'Wrong Password, Try Again'
        redirect_to admin_path
      end
  end

  def destroy
    reset_session
    flash[:notice] = 'Sucessfully logged out'
    redirect_to root_path
  end
end
