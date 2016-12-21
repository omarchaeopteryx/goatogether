class InvitesController < ApplicationController

  def index
  end

    def new
  end

  def create
  end

  def show
    @invite = Invite.find_by_id(params[:id])
    @journey = Journey.new
    if current_user
      @pending_invitations = Invite.where("guest_id = ?", current_user.id)
    else
      redirect_to '/'
    end
    render :show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

end
