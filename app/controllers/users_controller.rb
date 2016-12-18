class UsersController <  ApplicationController
  def index
    @allresults = []
    @results1 = current_user.twitter.search("#goatogether")
    @results2 = current_user.twitter.search("#GoatTogether")
    # @results3 = current_user.twitter.search("@realDonaldTrump")
    @allresults << @results1
    @allresults << @results2
    # @allresults << @results3

     respond_to do |format|
      format.html
      format.json { render json: @allresults }
    end
  end

  def new
    render 'login'
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
