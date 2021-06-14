class HomeController < ApplicationController
  before_action :check_admin 
  def index
    @message = "Panificadora Santo Antonio!"
    end

  def check_admin
    if carry_admin.nil?
      create_admin
    end
  end

  def carry_admin
    User.find_by(email: "admin@admin.com")
  end

  def create_admin
    admin = User.new(email: "admin@admin.com", password: "123456", name: "admin", role: "Admin")
    admin.save()
  end
end
