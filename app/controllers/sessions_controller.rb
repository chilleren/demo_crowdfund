class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in user
      flash[:notice] = 'Welcome back!'
      redirect_to root_url
    else 
      flash.now[:alert] = 'Invalid email address or password.'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
  
end
