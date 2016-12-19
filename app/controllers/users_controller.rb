class UsersController <  ApplicationController

  before_action :require_login, except: [:new]

  def new
    render 'login'
  end

  def create

  end

  def edit

  end

  def index

  end

  def show
    if current_user
      render :show
    else
      redirect_to new_user_path
    end
  end

  private

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
      current_user != nil
    end

    def require_login
      unless logged_in?
        flash[:error] = "Please sign up and join!"
        redirect_to new_user_path
      end
    end

end
