class UsersController <  ApplicationController
  def index

  end

  def new
    render 'login'
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
