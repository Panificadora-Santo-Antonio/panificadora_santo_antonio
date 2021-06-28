class ProductSalesController < ApplicationController

  before_action :authenticate_user!
  before_action :get_venda
  before_action :set_product_sale, only: %i[ show edit update destroy ]
  before_action :check_role, only: %i[ index edit update]

  # GET /product_sales or /product_sales.json
  def index
    @product_sales = ProductSale.all
  end

  # GET /product_sales/1 or /product_sales/1.json
  def show
  end

  # GET /product_sales/new
  def new
    @product_sale = @sale.product_sale.build
    @all_products = Produto.all
    @products = []
    @all_products.each do |pp|
      name = pp.nome
      id = pp.id
      @products.push([name, id])
    end
  end

  # GET /product_sales/1/edit
  def edit
  end

  # POST /product_sales or /product_sales.json
  def create
    @product_sale = @sale.product_sale.build(product_sale_params)
    if @product_sale.produto.quantidade > 0
      if !@product_sale.quantity.nil?
        if (@product_sale.produto.quantidade - @product_sale.quantity) > 0
          respond_to do |format|
            if @product_sale.save
              ProductSale.update(@product_sale.id, :total_product_price => @product_sale[:quantity].to_d * @product_sale.produto.preco.to_d )
              Sale.update(@sale.id, :totalValue => @sale[:totalValue].to_d + (@product_sale[:quantity].to_d * @product_sale.produto.preco.to_d))
              format.html { redirect_to @sale, notice: "Product sale was successfully created." }
              format.json { render :show, status: :created, location: @product_sale }
            else
              format.html { render :new, status: :unprocessable_entity }
              format.json { render json: @product_sale.errors, status: :unprocessable_entity }
            end
          end
        else
          redirect_to sale_path(@sale), notice: "Products quantity  exceeds the quantity in stock."
        end
      else
       redirect_to sale_path(@sale), notice: "Quantity of products field must be filled."
      end
    else
      redirect_to sale_path(@sale), notice: "Out of stock product."
    end
  end

  # PATCH/PUT /product_sales/1 or /product_sales/1.json
  def update
    respond_to do |format|
      if @product_sale.update(product_sale_params)
        format.html { redirect_to @product_sale, notice: "Product sale was successfully updated." }
        format.json { render :show, status: :ok, location: @product_sale }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product_sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_sales/1 or /product_sales/1.json
  def destroy
    @product_sale.destroy
    respond_to do |format|
      format.html { redirect_to sale_path(@sale), notice: "Product sale was successfully destroyed." }
      format.json { head :no_content }
    end
    Sale.update(@sale.id, :totalValue => @sale[:totalValue].to_d - (@product_sale[:quantity].to_d * @product_sale.produto.preco.to_d))
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_sale
      @product_sale = ProductSale.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_sale_params
      params.require(:product_sale).permit(:sale_id,:produto_id,:quantity, :total_product_price)
    end

    def get_venda
      @sale = Sale.find(params[:sale_id])
    end
end
