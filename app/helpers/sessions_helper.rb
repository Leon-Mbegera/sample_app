module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
  end

  # Retrieving the logged in user in every page they visit
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
