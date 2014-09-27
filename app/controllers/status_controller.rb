class StatusController < ApplicationController

  before_filter :auth_required

  def new
    @user = current_user
  end

  def create
    status = params[:status] || ''
    current_user.status = status
    current_user.save
    redirect_to '/all'
  end

  def show
    @user = current_user
  end

  def index
    @users = User.order("updated_at desc").limit(10)
  end

end