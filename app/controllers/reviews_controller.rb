class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @user = User.new

    @id = params[:id]
  end

  def create
    @review = Review.new(review_params)

    @review.reviewer_id = @current_user.id

    # Why isnt this working?
    @review.reviewed_user_id = @id

    if @review.save
      redirect_to products_path
    else
      redirect_to(new_review_path) 
    end
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

  def review_params
    params.require('review').permit(:review)
  end
end
