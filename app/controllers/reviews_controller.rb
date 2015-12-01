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
    ##
    ##
    ##
    if @user.total_ratings == 0 or @user.total_ratings == nil
      @input_rating = params[:review]
      @input_rating = @input_rating["rating"].to_d
      average = @input_rating
      ratings = 1

      @user.update average_rating: average, total_ratings: ratings
    else
      ratings = @user.total_ratings
      average = @user.average_rating
      @input_rating = params[:review]
      @input_rating = @input_rating["rating"].to_d
      puts "Input Rating:"
      puts @input_rating

      existing_rating = average * ratings
      existing_rating += @input_rating

      ratings += 1

      new_rating = (existing_rating / ratings)

      # Still not updating
      @user.update average_rating: new_rating, total_ratings: ratings

      puts "Here!!!!!1"
    end


    if @review.save!
      puts "Review has saved!"
      #if @user.update total_ratings: 1, average_rating: 1.0
      redirect_to products_path
    else
      "Review did not save!"
      redirect_to products_path 
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
