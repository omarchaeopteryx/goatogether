class LocationsController < ApplicationController
  def index
    @journey = Journey.new
    @allresults = []
    if current_user
      @allresults = []
      # @allresults << filterGeoOnly(current_user.twitter)
      respond_to do |format|
        format.html
        format.json { render json: @allresults }
      end
    else
      render 'users/login', layout: false
    end
  end

  def edit

  end

  def show

  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def filterGeoOnly(twitter_client, max_id=nil, results=[], pins=3)
    if results.length >= pins
      results.slice!(pins..-1)
      return results
    else

      results2 = twitter_client.search("#coffee", geocode:"32,-117,50mi", max_id: max_id).to_a
      results.concat(results2)
      max_id = results.last.id

      results.select!{|tweet| tweet.geo? }
      filterGeoOnly(twitter_client, max_id, results)
    end
  end
end
