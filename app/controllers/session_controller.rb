class SessionController < ApplicationController

  def new
  end

  def create
    user = User.find_by_username params[:username]
    if user && (user.authenticate params[:password])
      @user = login! user
      redirect_to '/home'
    else
      render text: 'invalid credentials, try again or go away please'
    end
  end

  def destroy
    logout!
    redirect_to '/'
  end
end