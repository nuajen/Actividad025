class SalesController < ApplicationController

  def index
    @sales = Sale.all
  end

  def new
    @sale = Sale.new
  end

  def create
    @sale = Sale.new(sale_params)
    if params[:sale][:tax] == '1'
      @sale.total = (@sale.value - @sale.discount) * 1.19
      @sale.tax = 19
    else
      @sale.total = @sale.value - @sale.discount
      @sale.tax = 0
    end
    if @sale.save
      redirect_to sales_done_path
    else
      render :new
    end
  end

  def done
    @sales = Sale.all
  end

  private
  def sale_params
    params.require(:sale).permit(:cod, :detail, :category, :value, :discount)
  end

end
