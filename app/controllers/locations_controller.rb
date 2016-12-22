class LocationsController < ApplicationController
  def index
    @journey = Journey.new
    puts "AAAAAAAAAAAAAHHHHHHHHH==============++=++++"
    @allresults = []
    if current_user
      @pending_invitations = Invite.where("guest_id = ? AND response IS ?", current_user.id, nil).order("created_at DESC")
      # @allresults << twitter_search(current_user.twitter, "#coffee")
      respond_to do |format|
        format.html
        format.json { render json: @allresults }
      end
    else
      if request.xhr?
        render 'users/login', layout: false
      end
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

 def twitter_search(twitter_client, search_term, max_id=nil, results=[], pins=2)
    search_term = search_term.to_s
    if results.length >= pins
      results.slice!(pins..-1)
      return results
    else

      results2 =  current_user.twitter.search(search_term, geocode:"32,-117,100mi", max_id: max_id).take(10).to_a
      results = results.concat(results2)
      max_id = results.last.id

      results.select!{|tweet| tweet.geo? }
      twitter_search(twitter_client,search_term, max_id, results)
    end
  end

   def range (min, max)
    rand * (max-min) + min
   end

   def create_random_tweet
    {
    'coordinates': {'coordinates': [range(-80,-124),range(18,49)]},
    'text': Faker::Hipster.sentences(1).first,
    'name': Faker::Name.name
   }
   end

end
