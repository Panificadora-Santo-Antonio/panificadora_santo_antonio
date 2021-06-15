class UsersController < ApplicationController

  before_action :check_role, only: %i[ index ]

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end
end
