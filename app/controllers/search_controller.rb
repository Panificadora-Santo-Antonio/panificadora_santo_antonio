class SearchController < ApplicationController
  def index
    @sales = Sale.all
    @sales = @sales.joins(:customer)
    if params[:name].present?
      #@sales = @sales.where("customers.name like '%#{params[:name]}%'")
      name_like = Customer.arel_table['name']
      phone_like = Customer.arel_table['phone']
      @sales = @sales.where(name_like.matches("%#{params[:name]}%")).or(@sales.where(phone_like.matches("%#{params[:name]}%")))
    end

    if params[:start_date].present? && params[:final_date].present?
      start_date = DateTime.parse(params[:start_date]).beginning_of_day
      final_date = DateTime.parse(params[:final_date]).end_of_day
      start = (params[:start_date])
      final = (params[:final_date])
      @sales = @sales.where("sales.created_at >= '" + start + "'")
      @sales = @sales.where("sales.created_at <= '" + final + "'")
    elsif  params[:start_date].present? && params[:final_date].blank?
      start = (params[:start_date])
      start_date = DateTime.parse(params[:start_date]).beginning_of_day
      @sales = @sales.where("sales.created_at >= '" + start + "'")
    elsif  params[:start_date].blank? && params[:final_date].present?
      final = (params[:final_date])
      final_date = DateTime.parse(params[:final_date]).end_of_day
      @sales = @sales.where("sales.created_at <= '" + final + "'")
    end

    if params[:value_of].present? && params[:value_up_to].present?
      valueOf = (params[:value_of])
      valueUpTo = (params[:value_up_to])
      @sales = @sales.where("sales.totalValue >= '" + valueOf + "'")
      @sales = @sales.where("sales.totalValue <= '" + valueUpTo + "'")
    elsif params[:value_of].present? && params[:value_up_to].blank?
      valueOf = (params[:value_of])
      @sales = @sales.where("sales.totalValue >= '" + valueOf + "'")
    elsif  params[:value_of].blank? && params[:value_up_to].present?
      valueUpTo = (params[:value_up_to])
      @sales = @sales.where("sales.totalValue <= '" + valueUpTo + "'")
    end

    @sales_total = @sales
    options = {page: params[:page] || 1, per_page: 5}
    @sales = @sales.paginate(options)

  end
end
