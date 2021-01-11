class ProductsController < ApplicationController
  # before_action :set_category, only: [:new, :edit, :create, :update, :destroy]
  before_action :set_product, except: [:index, :new, :create, :get_category_children, :get_category_grandchildren]
  
  def index
    @products = Product.all.order('created_at DESC')
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

  def show
    @category = @product.category
    @product_image = ProductImage.find_by(product_id: params[:id])
    @product_images = ProductImage.all.where(product_id: params[:id])
    @purchase_history = PurchaseHistory.find_by(product_id: params[:id])
  end

  def edit
    @product_image = @product.product_images.build
    count = @product.product_images.count
    image_count = 2
    (image_count - count).times { @product.product_images.build }
    # binding.pry
    
  end

  def update
    destroy_count = 0

    if productedit_params["product_images_attributes"]["0"]
      params0 = productedit_params["product_images_attributes"]["0"]["_destroy"].to_i
      destroy_count += params0
    else
      false
    end

    if productedit_params["product_images_attributes"]["1"]
      params1 = productedit_params["product_images_attributes"]["1"]["_destroy"].to_i
      destroy_count += params1
    else
      false
    end

    if productedit_params["product_images_attributes"]["2"]
      params2 = productedit_params["product_images_attributes"]["2"]["_destroy"].to_i
      destroy_count += params2
    else
      false
    end

    unless ProductImage.all.where(product_id: params[:id]).count == destroy_count && params[:product_images] == nil
      if @product.update(productedit_params)
        unless params[:product_images] == nil
          params[:product_images]['image'].each do |i|
            @product_image = @product.product_images.create!(image: i)
          end
        end
        redirect_to product_path(@product)
      else
        @product_image = @product.product_images.build
        count = @product.product_images.count
        image_count = 2
        (image_count - count).times { @product.product_images.build }
        render :edit
      end
    else
      @product_image = @product.product_images.build
      count = @product.product_images.count
      image_count = 2
      (image_count - count).times { @product.product_images.build }
      render :edit
    end

  end

  def destroy
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
    params.require(:product).permit(:name, :description, :brand_id, :size_id, :category_id, :status, :shipping_cost,:prefecture_id, :days, :price, product_images_attributes: [:image]).merge(user_id: current_user.id)
  end

  def productedit_params
    params.require(:product).permit(:name, :description, :brand_id, :size_id, :category_id, :status, :shipping_cost, :prefecture_id, :days, :price, product_images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def set_category
    @category_parent_array = Category.where(ancestry: nil)
  end
end