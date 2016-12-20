class JourneysController < ApplicationController
  def new
  end

  def search
   search = params[:search]
   @users = twitter_search(current_user.twitter, search)

   if request.xhr?
    render :json => @users
   else
    render :_search
   end
  end

  def create
    @journey = Journey.new(journey_params)
    @invite = Invite.new(invite_params)
    if @journey.save
      if @invite.save
        redirect_to "/users/#{current_user.id}"
      else
        @invite.errors.full_messages
      end
    else
      @journey.errors.full_messages
    end
  end

  private

  def twitter_search(twitter_client, search_term, max_id=nil, results=[], pins=5)
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

  def journey_params
    params.require(:journey).permit(:name, :hashtag)
  end

  def invite_params
    params.require(:invite).permit(:friends, :start_date, :end_date, :time)
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
