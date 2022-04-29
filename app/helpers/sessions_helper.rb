module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
  end

  # Retrieving the logged in user in every page they visit
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def logout
    reset_session
    @current_user = nil
  end
end
