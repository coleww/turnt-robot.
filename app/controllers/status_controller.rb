class StatusController < ApplicationController

  before_filter :auth_required, only: [:new, :create, :show]

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
    @user = current_user
    @users = (User.order("updated_at desc").page params[:page]).per 12
  end

end