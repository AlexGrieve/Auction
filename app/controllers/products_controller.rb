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

  def update
      @product = Product.find(params[:id])

      # Not ideal
      @product.bids += 1

      if @product.update safe_product_params
          redirect_to @product
      else
        redirect_to root_path
    end
  end

  def buy_now
    @product = Product.find(params[:id])

    @product.buyer_id = @current_user.id
    @product.product_is_sold = true
    @product.current_price = @product.buy_now_price

    puts "Here"

    if @product.save
      redirect_to @product
    else
      redirect_to(user_path)
      puts "Failed"
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
