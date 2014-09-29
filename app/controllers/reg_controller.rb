class RegController < ApplicationController
  def new
  end

  def create
    if params[:token] && (token = Reg.find_by_token params[:token])
      token.destroy
      user = User.create! username: params[:username], password: params[:password]
      login! user
      redirect_to '/home'
    else
      flash[:error] = 'invalid credentials, try again or go away please'
      redirect_to "/"
    end
  end
end