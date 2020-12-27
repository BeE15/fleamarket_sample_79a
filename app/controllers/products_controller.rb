class ProductsController < ApplicationController
  # before_action :set_category, only: [:new, :edit, :create, :update, :destroy]
  before_action :set_product, except: [:index, :new, :create]
  
  def index
    @products = Product.all.order('created_at DESC')
    # @products = Product.includes(:images).order('created_at DESC')
    @product_images = ProductImage.all
    @parents = Category.where(ancestry: nil) 
    @purchase_history = PurchaseHistory.all
  end

  def new
    @product = Product.new
    @product_image = @product.product_images.build
  end

  def create
    @product = Product.new(product_params)
    unless params[:product_images] == nil
      if @product.save
        params[:product_images]['image'].each do |i|
          @product_image = @product.product_images.create!(image: i)
        end
        redirect_to product_path(@product)
      else
        @product.product_images.build
        render :new
      end
    else
      @product.product_images.build
      render :new
    end
  end

  def edit
  end

  def show
    @product = Product.find(params[:id])
    @categories = @product.categories
    @product_image = ProductImage.find_by(product_id: params[:id])
    @product_images = ProductImage.all.where(product_id: params[:id])
    @purchase_history = PurchaseHistory.find_by(product_id: params[:id])
  end
    

  def update
    if @product.update(product_params)
      redirect_to product_path(@product)
    else
      render :edit
      flash.now[:alert] = '商品情報の更新に失敗しました'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    if @product.user.id == current_user.id
      @product.destroy
      redirect_to root_path
    else
      render root_path
    end
  end

  def get_category_children
    @category_children = Category.find(params[:parent_name]).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :brand_id, :size_id, :status, :shipping_cost,:prefecture_id, :days, :price, product_images_attributes: [:image]).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end
  
  def set_category  
    @category_parent_array = Category.where(ancestry: nil)
  end
end