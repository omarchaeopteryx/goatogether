class UsersController <  ApplicationController
  def index
    @results = current_user.twitter.search("#GoatTogether",:result_type => "recent").take(5).collect
     respond_to do |format|
      format.html
      format.json { render json: @results }
    end
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
