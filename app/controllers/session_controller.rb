class SessionController < ApplicationController

  def new
  end

  def create
    user = User.find_by_username params[:username]
    if user && (user.authenticate params[:password])
      render text: 'hello turnt_up_robot!'
    else
      render text: 'invalid credentials, try again or go away please'
    end
  end
end