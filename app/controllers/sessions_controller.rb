class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      reset_session
      log_in user
      flash[:success] = "You're successfully Logged In"
      redirect_to user
    else
      flash.now[:danger] = "Invalid username or password, Please try again !"
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
