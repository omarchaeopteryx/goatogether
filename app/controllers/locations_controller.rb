class LocationsController < ApplicationController
  def index
    @allresults = []
    if current_user
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
    else
      render 'users/login', layout: false
    end


  end

  def show
    render 'index'
  end

   private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
