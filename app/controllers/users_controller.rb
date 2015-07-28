class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Signed up successfully. Welcome to the party!"
      log_in @user
      redirect_to root_path
    else
      flash[:alert] = @user.errors.full_messages.join(", ")
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update user_params
      flash[:notice] = "Account updated successfully."
      redirect_to edit_user_path @user
    else
      flash[:alert] = @user.errors.full_messages.join(", ")
      redirect_to edit_user_path @user
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end

    def logged_in_user
      unless logged_in?
        flash[:alert] = "Please log in first"
        redirect_to login_url
      end
    end

    def correct_user
      @user = User.find(params[:id])
      raise ActionController::RoutingError.new('Not Found') unless current_user == @user
    end

end
