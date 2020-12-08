class ProductsController < ApplicationController
    # before_action :set_category, only: [:new, :edit, :create, :update, :destroy] カテゴリー使うときは外す
    # before_action :set_product, except: [:index, :new, :create]　exceptとonly間違えでは？
  
  def index
    @products = Product.all
    @products = Product.includes(:images).order('created_at DESC')
    @product_images = ProductImage.all
    # @parents = Category.where(ancestry: nil) 
    @purchase_history = PurchaseHistory.all
    # render action: :new
  end

  def new
    @product = Product.new
    @product.product_images.build 
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to product_path(@product)
    else
      render :new
      flash.now[:alert] = "商品出品に失敗しました"
    end
  end

  def edit
  end

  def get_category_children
    @category_children = Category.find(params[:parent_name]).children
  end
  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
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
    # if @product.destroy
      # redirect_to :root
    # else
      # render :show
    # end
    @product = Product.find(params[:id])
    if @product.user.id == current_user.id
      @product.destroy
      redirect_to root_path
    else
      render root_path
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :status, :shipping_cost, :days, :price, :size　,:created_at, :updated_at).merge(user: current_user)
  end

  # def set_product
  #   @product = Product.find(params[:id])
  # end 
  # before aciton 使うなら外す。
  
  def set_category  
    @category_parent_array = Category.where(ancestry: nil)
  end
end