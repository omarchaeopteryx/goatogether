class JourneysController < ApplicationController
  def new
  end

  def create
    @journey = Journey.new(journey_params)
    @invite = Invite.new(invite_params)

    if @journey.save
      @invite.save
      redirect_to "/users/#{current_user.id}"
    else
      @journey.errors.full_messages
    end
  end

  def show
    @journey = find_journey
  end

  private

  def journey_params
    params.require(:journey).permit(:name, :hashtag, :start_time, :end_time, :time)
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
end
