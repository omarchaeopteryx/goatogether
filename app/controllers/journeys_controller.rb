class JourneysController < ApplicationController
  def new
  end

  def search
   search = params[:search]
   @users = User.where('lower(name) ~* ?', "[#{search.downcase}]")
   p @users
   render :_search

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
