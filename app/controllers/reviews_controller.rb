class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @user = User.new

    @id = params[:id]
  end

  def create
    @review = Review.new(review_params)

    @review.reviewer_id = @current_user.id

    #  Requires a hidden field in the submit form
    user = params[:reviewed_user_id].to_i
    @review.reviewed_user_id = user

    @user =  User.find(user)


    # Not saving the user, not recognizing the rating submitted
    ###
    ###
    ###  
    #@user.total_ratings == 0 or @user.total_ratings == nil
    average = 3.0
    ratings = 1
    # else
    #   ratings = @user.total_ratings
    #   average = @user.average_rating
    #   puts "Rating ="
    #   puts ratings
    #   puts "Average"
    #   puts average
    #   existing_rating = average * ratings
    #   existing_rating += params[:rating]
    #   @user.total_ratings += 1

    #   @user.average_rating = (existing_rating / @user.total_ratings)
    # end

    if @user.update total_ratings: ratings, average_rating: average
      products_path
      puts "User updated!"
    else
      new_review_path
    end

    # if @review.save
    #   products_path
    # else
    #   redirect_to(new_review_path) 
    # end
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
