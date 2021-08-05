class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_product, only: [:show ,:edit, :update, :destroy]
  before_action :edit_product, only: [:edit, :update, :destroy]

  def index
    @products = Product.order("id DESC")
  end

  def new
    @product = Product.new
  end

  def show
  end

  def edit
  end

  def destroy
    if @product.destroy
      redirect_to root_path
    end
  end

  def update
    if @product.update(product_params)
      redirect_to product_path 
    else
      render 'edit'
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

  def edit_product
    unless current_user.id == @product.user_id
      redirect_to root_path
    end 
  end


  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:image,:name,:detail,:status_id,:burden_id,:area_id,:shipping_date_id,:category_id,:money).merge(user_id: current_user.id)
  end
end

