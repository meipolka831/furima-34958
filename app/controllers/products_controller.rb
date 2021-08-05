class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @products = Product.order("id DESC")
  end

  def new
    @product = Product.new
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
    unless current_user.id == @product.user_id
      redirect_to root_path
    else
      render 'new'
    end 
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to product_path 
    else
      render 'new'
    end
  end

  def create
    @product = Product.new(product_params)
    if @product.save
        redirect_to root_path
    else
        render 'new'
    end
  end



  private

  def product_params
    params.require(:product).permit(:image,:name,:detail,:status_id,:burden_id,:area_id,:shipping_date_id,:category_id,:money).merge(user_id: current_user.id)
  end
end

