class SearchController < ApplicationController
  before_action :authenticate_user!
  before_action :check_role
  def index
    @sales = Sale.all
    @sales = @sales.joins(:customer)
    if params[:name].present?
      #@sales = @sales.where("customers.name like '%#{params[:name]}%'")
      name_like = Customer.arel_table['name']
      phone_like = Customer.arel_table['phone']
      @sales = @sales.where(name_like.matches("%#{params[:name]}%")).or(@sales.where(phone_like.matches("%#{params[:name]}%")))
    end

    start = params[:start_date]
    final = params[:final_date]
    SaleSearchInARange 'created_at',start,final

    start = params[:value_of]
    final = params[:value_up_to]
    SaleSearchInARange 'totalValue',start,final


    if params[:user_id].present?
      @sales = @sales.where(user_id: params[:user_id])
    end

    @sales_total = @sales
    options = {page: params[:page] || 1, per_page: 5}
    @sales = @sales.paginate(options)

  end

  def SaleSearchInARange (attribute,start,final)
    if start.present? && final.present?
      @sales = @sales.where(["sales."+attribute+" >= ? AND sales."+attribute+" <= ? " , start,final])

    elsif start.present?
      @sales = @sales.where(["sales."+attribute+" >= ? ",start])

    elsif final.present?
      @sales = @sales.where(["sales."+attribute+" <= ? ",final])
    end
  end
end
