class HomeController < ApplicationController
  before_action :check_admin 
  def index
    @message = "Panificadora Santo Antonio!"
    end

  def check_admin
    @admin = query_admin
    if @admin.nil?
      create_admin
    else
      if @admin.role != "Admin"
        update_role_admin(@admin)
      end
    end
  end

  def query_admin
    @admin = User.find_by(email: "admin@admin.com")
  end

  def create_admin
    admin = User.new(email: "admin@admin.com", password: "123456", name: "admin", role: "Admin")
    admin.save()
  end

  def update_role_admin(admin)
    admin.update(role: "Admin")
  end
end
