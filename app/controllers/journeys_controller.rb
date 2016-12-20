class JourneysController < ApplicationController
  def index
    @journeys = Journey.where(user_id: session[:user_id])
  end

  def new
    @journey = Journey.new
  end

  def create
    @journey = Journey.new(journey_params)
    if @journey.save
      friends.each do |friend|
        @invite = Invite.new(journey_id: @journey.id)
        # convert friend into a twitter uid
        @uid = current_user.twitter.user("#{friend.slice!(0)}").id
        @invite.guest_id = User.find_by(uid: @uid).id
      end
      respond_to do |format|
        format.html {}
        format.json {}
      end
    else
      @journey.errors.full_messages
       respond_to do |format|
        format.html { redirect_to "/users/#{current_user.id}" }
        format.json {}
      end
    end


  end

  def show
    @journey = find_journey
  end

  private
  def uid_to_username

  end
  # takes the friends param and breaks it up into individual people
  def friends
    params[:friends][:guest_id].split(", ")
  end

  def journey_params
    params.require(:journey).permit(:name, :hashtag, :start_time, :end_time)
  end

  def invite_params
    params.require(:invite).permit(:guest_id)
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def find_journey
    Journey.find_by(id: [params: id])
  end

  def upcoming_journey
    Journey.find_by(user_id: session[:user_id])
  end

  def previous_journey

  end
end
