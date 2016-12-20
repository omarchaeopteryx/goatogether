class JourneysController < ApplicationController
  def index
    @journey = Journey.new
    @journeys = users_journeys
    # redirect_to '/' # <-- This still breaks when tries to redirect to show page
  end

  def new
    @journey = Journey.new
    render :_new
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
        @invite = Invite.new(journey_id: @journey.id, guest_id: @guest.id)
        @invite.save
        p "invite.id: #{@invite.id}, invite.guest_id: #{@invite.guest_id}, invite.journey_id: #{@invite.journey_id}"
      end
      respond_to do |format|
       format.html {redirect_to journeys_path}
      end
    else
      @journey.errors.full_messages
      respond_to do |format|
        format.html { redirect_to "/users/#{current_user.id}" }
      end
    end
  end

  def show
    @journey = find_journey
  end

  private

  # takes the friends param and breaks it up into individual people
  def friends
    params[:friends][:guest_id].split(", ")
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

  def users_journeys
    Journey.where(user_id: session[:user_id])
  end
end
