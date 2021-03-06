module SessionsHelper
  def log_in user
    session[:user_id] = user.id
  end

  def log_out
    @current_user = nil
    session.delete :user_id
  end

  def current_user
    return unless user_id = session[:user_id]

    @current_user ||= User.find_by id: user_id
  end

  def logged_in?
    current_user.present?
  end
end
