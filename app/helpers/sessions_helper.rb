module SessionsHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end
  
  def current_routine
    @current_routine ||= Routine.find_by(id: session[:routine_id])
  end
end
