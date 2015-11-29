class ProductsController < ApplicationController
  before_action :load_product, only: [:edit, :show, :update, :buynow]

  def index
    @product = Product.search_for(params[:q])
    @user = User.all
    @review = Review.all
  end

  def new
    @product = Product.new
    @id = params[:id]
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

      if @product.update safe_product_params
        redirect_to @product
      else
        redirect_to root_path
    end
  end

  def bid
    @product = Product.find(params[:buyer_id])

    # Do not allow bids less than current price
    if params[:current_price].to_d > @product.current_price
      @product.buyer_id = @current_user.id
      @product.bids += 1
      @product.current_price = params[:current_price]

      if @product.save
        redirect_to @product
      else
        redirect_to(user_path)
      end
    else
      flash[:notice] = "Bid must be higher than current bid!"
      redirect_to @product
    end
  end

  def buy_now
    @product = Product.find(params[:id])

    @product.buyer_id = @current_user.id
    @product.product_is_sold = true
    @product.current_price = @product.buy_now_price
    @product.auction_is_over = true

    if @product.save
      redirect_to @product
    else
      redirect_to(user_path)
    end
  end 

  def delete
  end

  private
  def safe_product_params
    params.require('product').permit(:name, :category, :description, :long_description, :starting_price, :buy_now_price, :current_price, :min_price, :end_date, :buyer_id, :avatar)
  end

  def load_product
    @product = Product.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash.now[:notice] = "Invalid Story ID #{params[:id]}"
    redirect_to root_path
  end
end
