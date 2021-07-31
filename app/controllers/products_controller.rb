class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    #@products = Product.all
  end

  def new
    @product = Product.new
  end

  #def edit
  #end

  def create
    @product = Product.new(product_params)
    if @product.save
        ridirect_to root_path
    else
        render 'new'
    end
  end



  private

  def product_params
    params.require(:product).permit(:image,:name,:detail,:status_id,:burden_id,:area_id,:shipping_date_id,:category_id,:money).merge(user_id: current_user.id)
  end
end

