class UsersController < ApplicationController

  before_action :check_role, only: %i[ index ]

  def show
    @user = current_user
  end

  def index
    @users = User.all
  end
end
