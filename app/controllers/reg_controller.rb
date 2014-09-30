class RegController < ApplicationController
  def new
    @register = true
  end

  def create
    if params[:token] && (token = Reg.find_by_token params[:token])
      user = User.new username: params[:username].gsub(/\s/, ''), password: params[:password]
      if user.save && token.destroy
        login! user
        redirect_to '/home'
      else
        flash[:error] = user.errors.full_messages.join " "
        redirect_to '/register'
      end
    else
      flash[:error] = 'invalid credentials, try again or go away please'
      redirect_to "/"
    end
  end
end