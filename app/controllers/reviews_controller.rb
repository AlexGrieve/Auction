class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @user = User.new

    @id = params[:id]
  end

def create
    @review = Review.new(review_params)

    # @review.reviewer_id = @current_user.id
    @review.reviewer = @current_user

    # Requires a hidden field in the submit form
    # user = params[:reviewed_user_id].to_i
    @user = User.find params[:reviewed_user_id].to_i
    @review.reviewed = @user

    # @user =  User.find(user)

    # Not saving the user, not recognizing the rating submitted
    if @user.total_ratings == 0 or @user.total_ratings == nil
      puts "Here!"
      average = 2
      ratings = 1
    else
      ratings = @user.total_ratings
      average = @user.average_rating
      puts "Rating ="
      puts ratings
      puts "Average"
      puts average
      existing_rating = average * ratings
      existing_rating += params[:rating]
      @user.total_ratings += 1

      @user.average_rating = (existing_rating / @user.total_ratings)
    end


    if @review.save
      if @user.update total_ratings: 1, average_rating: 1.0
      else
        redirect_to new_review_path
      end
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
    params.require('review').permit(:review, :rating)
  end
end
