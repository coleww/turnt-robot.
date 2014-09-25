class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  helper_method :current_user

  def login! user
    session[:session_token] = user.session_token
    @current_user = user
  end

  def logout!
    current_user.try(:reset_session_token!)
    session[:token] = nil
  end

  def current_user
    return nil if session[:session_token].nil?
    @current_user ||= (User.find_by_session_token session[:session_token])
  end

  def auth_required
    flash[:error] = 'You must login first'
    redirect_to '/' if current_user.nil?
    true
  end

end
