class ProductsController < ApplicationController
  before_action :load_product, only: [:edit, :show, :update, :buynow]

  def index
    @product = Product.all
    @user = User.all
    @review = Review.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = @current_user.product.create(safe_product_params)

    if @product.save
      redirect_to @product
    else
      render 'new'
    end
  end

  def edit
    @product = Product.find(params[:id])
    if @url.nil?
      redirect_to root_path
    end
  end

  # How to update the price?
  # Set_current_price in prodct.rb getting in the way?
  def update
      @product = Product.find(params[:id])
      if @product.update safe_product_params
        redirect_to @product
      else
        redirect_to root_path
    end
  end

  def delete
  end



  private
  def safe_product_params
    params.require('product').permit(:name, :category, :description, :starting_price, :buy_now_price, :current_price, :min_price, :end_date)
  end

  def load_product
    @product = Product.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash.now[:notice] = "Invalid Story ID #{params[:id]}"
    redirect_to root_path
  end
end
