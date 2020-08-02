class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      flash[:success] = "you have successfully login"
      session[:user_id] = user.id
      redirect_to user_path(user)

    else
      flash.now[:danger] = "Their is something wrong with your login"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "you have logout"
    redirect_to root_path

  end
end
