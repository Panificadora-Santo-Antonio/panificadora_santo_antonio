class SearchController < ApplicationController
  def index
    @sales = Sale.all
    @sales = @sales.joins(:customer)
    if params[:name].present?
      #@sales = @sales.where("customers.name like '%#{params[:name]}%'")
      name_like = Customer.arel_table['name']
      phone_like = Customer.arel_table['phone']
      @sales =@sales.where(name_like.matches("%#{params[:name]}%")).or(@sales.where(phone_like.matches("%#{params[:name]}%")))
    end

    #if params[:date_of].present? && params[:date_until].present?
    # date_of = date_time.parse(params[:date_of]).beginning-of_day
    # date_until = date_time.parse(params[:date_until]).end_of_day

    #elsif  params[:date_of].present? && params[:date_until].blank?
    # date_of = date_time.parse(params[:date_of]).beginning-of_day
    #elsif  params[:date_of].blank? && params[:date_until].present?
    #  date_until = date_time.parse(params[:date_until]).end_of_day
    #end

    @sales_total = @sales
    options = {page: params[:page] || 1, per_page: 5}
    @sales = @sales.paginate(options)

  end
end
