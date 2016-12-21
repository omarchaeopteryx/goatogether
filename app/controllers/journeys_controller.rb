class JourneysController < ApplicationController
  def index
    @journey = Journey.new
<<<<<<< HEAD
    @journeys = users_journeys
    # redirect_to '/'
=======
    @upcoming_journeys = Journey.by(current_user).upcoming
    @previous_journeys = Journey.by(current_user).previous

    if request.xhr?
      render :index, layout: false
    else
      render :'index'
    end
>>>>>>> 701f155c96dee50722f631c00cd942ea928dba8d
  end

  def new
    @journey = Journey.new
    respond_to do |format|
     format.html { render :_new }
     format.json
    end
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
    @journey.user_id = current_user.id
    if @journey.save
      friends.each do |friend|
        uid = current_user.twitter.user("#{friend}").id
        @guest = User.find_or_initialize_by(uid: uid)
        @guest.provider = "twitter"
        @guest.name = "guest"
        @guest.save
        @invite = Invite.create(journey_id: @journey.id, guest_id: @guest.id)
      end
      if request.xhr?
        @upcoming_journeys = Journey.by(current_user).upcoming
        @previous_journeys = Journey.by(current_user).previous
        render :index, layout: false
      end
    else
      @journey.errors.full_messages
      respond_to do |format|
        format.html { redirect_to "/users/#{current_user.id}" }
      end
    end
  end

  def show
    @journey = Journey.find(params[:journey_id])
    @result = current_user.twitter.search("#{@journey.user.nickname} #{@journey.hashtag}").to_a
    @result.select! do |result|
      p result.created_at
      result.created_at >= @journey.start_time && result.created_at <= @journey.end_time
    end
    render :show
  end

  def random
    journeys = Journey.where('user_id != ?', current_user.id)
    random_journey = []
    journeys.each do |journey|
      journey.invites.each do |invite|
        if invite.guest_id != current_user.id
          random_journey << journey
        end
      end
    end
    journey_count = random_journey.count
    @journey = random_journey[rand(0..(journey_count-1))]
    render :show
  end

  def edit
    @journey = Journey.find_by_id(params[:id])
  end

private

  # takes the friends param and breaks it up into individual people
  def friends
    params[:friends][:guest_id].split(", ")
  end


  def twitter_search(twitter_client, search_term, max_id=nil, results=[], pins=5)
    search_term = search_term.to_s
    if results.length >= pins
      results.slice!(pins..-1)
      return results
    else

      results2 = twitter_client.search("#{user} #{hashtag}", max_id: max_id).take(3).to_a
      results.concat(results2)
      p results
      max_id = results.last.id
      results.select!{|tweet| tweet.geo? }
      journey_search(twitter_client, hashtag, start_time, end_time, max_id, results)


      results2 =  current_user.twitter.search(search_term, geocode:"32,-117,100mi", max_id: max_id).take(10).to_a
      results = results.concat(results2)
      max_id = results.last.id

      results.select!{|tweet| tweet.geo? }
      twitter_search(twitter_client,search_term, max_id, results)

    end
  end

  def journey_params
    params.require(:journey).permit(:name, :hashtag, :start_time, :end_time, :user_id)
  end

  def invite_params
    params.require(:invite).permit(:guest_id)
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def find_journey
    Journey.find_by(id: params[:id])
  end
end
