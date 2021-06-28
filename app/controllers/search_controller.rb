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
      @sales = @sales.where(["sales.created_at >= ? AND sales.created_at <= ? " , "#{params[:start_date]}","#{params[:final_date]}"])

    elsif  params[:start_date].present? && params[:final_date].blank?
      @sales = @sales.where(["sales.created_at >= ? ","#{params[:start_date]}"])

    elsif  params[:start_date].blank? && params[:final_date].present?
      @sales = @sales.where(["sales.created_at <= ? ","#{params[:final_date]}"])
    end

    if params[:value_of].present? && params[:value_up_to].present?
      @sales = @sales.where(["sales.totalValue >= ? AND sales.totalValue <= ? " , "#{params[:value_of]}","#{params[:value_up_to]}"])
      #@sales = @sales.where("sales.totalValue >= '" + valueOf + "'")
      #@sales = @sales.where("sales.totalValue <= '" + valueUpTo + "'")
    elsif params[:value_of].present? && params[:value_up_to].blank?
      @sales = @sales.where(["sales.totalValue >= ?","#{params[:value_of]}"])
    elsif  params[:value_of].blank? && params[:value_up_to].present?
      @sales = @sales.where(["sales.totalValue <= ?","#{params[:value_up_to]}"])
    end

    @sales_total = @sales
    options = {page: params[:page] || 1, per_page: 5}
    @sales = @sales.paginate(options)

  end
end
