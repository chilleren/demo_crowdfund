class UsersController < ApplicationController

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
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end


end
