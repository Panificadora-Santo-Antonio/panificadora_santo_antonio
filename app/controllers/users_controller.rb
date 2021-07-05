class UsersController < ApplicationController

  before_action :check_role, only: %i[ index destroy ]

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_path, notice: "Usuario apagado com sucesso" }
      format.json { head :no_content }
    end
  end
end
