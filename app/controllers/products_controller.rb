class ProductsController < ApplicationController

  
  def new
  end
  
  def index
    @products = Product.all
    @product_images = ProductImage.all
  end

  def show
    @product = Product.find(params[:id])
    @categories = @product.categories
    @product_image = ProductImage.find_by(product_id: params[:id])
    @product_images = ProductImage.all.where(params[:ids])
  end

end

