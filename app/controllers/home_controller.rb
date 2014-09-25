class HomeController < ApplicationController

  before_filter :auth_required

  def index
    @user = current_user
  end

end