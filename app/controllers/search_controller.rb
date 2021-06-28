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
      @sales = @sales.where("sales.created_at >= '#{start_date.strftime("%Y-%m-%d")}'?",params[:start_date])
      @sales = @sales.where("sales.created_at <= '#{final_date.strftime("%Y-%m-%d")}'?",params[:final_date])
    elsif  params[:start_date].present? && params[:final_date].blank?
      start_date = DateTime.parse(params[:start_date]).beginning_of_day
      @sales = @sales.where("sales.created_at >= '#{start_date.strftime("%Y-%m-%d")}'?",params[:start_date])
    elsif  params[:date_of].blank? && params[:final_date].present?
      final_date = DateTime.parse(params[:final_date]).end_of_day
      @sales = @sales.where("sales.created_at <= '#{final_date.strftime("%Y-%m-%d")}'?",params[:final_date])
    end

    if params[:value_of].present? && params[:value_up_to].present?
      @sales = @sales.where("sales.totalValue >= '#{params[:value_of]}'?",params[:value_of])
      @sales = @sales.where("sales.totalValue <= '#{params[:value_up_to]}'?",params[:value_up_to])
    elsif params[:value_of].present? && params[:value_up_to].blank?
      @sales = @sales.where("sales.totalValue >= '#{params[:value_of]}'?",params[:value_of])
    elsif  params[:value_of].blank? && params[:value_up_to].present?
      @sales = @sales.where("sales.totalValue <= '#{params[:value_up_to]}'?",params[:value_up_to])
    end

    @sales_total = @sales
    options = {page: params[:page] || 1, per_page: 5}
    @sales = @sales.paginate(options)

  end
end
