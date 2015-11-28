class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # Create a new user from input parameters 
    @user = User.new(user_params)

    # Save the user
    if @user.save
      # Create a session and redirect to the user's page
      session[:user_id] = @user.id
      redirect_to user_path(:user_id)  
    else
      # Sign up failed
      redirect_to signup_path  
    end
  end

  def edit
  end

  def update
  end

  def login
    # session[:user_id] = @user.id
    # redirect_to user_path(@user) 
  end

  def show
    @user = @current_user
  end

  def logout
    session[:user_id] = nil
    redirect_to root_path
  end

  def authenticate
    # Find the user
    user = User.find_by email: params[:email]

    # Check that the user is legit and start the session
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      redirect_to login_path
    end
  end

  private
    # Method for safely accepting user input for creating a user
    def user_params
      params.require('user').permit(:first_name, :last_name, :email, :password, :password_confirmation, :cash, :avatar, :total_ratings, :average_rating)
    end

end
