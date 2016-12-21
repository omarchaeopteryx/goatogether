class InvitesController < ApplicationController

  def index
    if current_user
      @pending_invitations = Invite.where("guest_id = ? AND response IS ?", current_user.id, nil).order("created_at DESC")
    end
  end

    def new
  end

  def create
  end

  def show
    @invite = Invite.find_by_id(params[:id])
    @journey = Journey.new
    if current_user
      @pending_invitations = Invite.where("guest_id = ? AND response IS ?", current_user.id, nil).order("created_at DESC")
    else
      redirect_to '/'
    end
    render :show
  end

  def edit
    @invite = Invite.find_by_id(params[:id])
    puts "Here's your response" + params[:response]
  end

  def update
    @invite = Invite.find_by_id(params[:id])
    @invite.update_attributes(response: params[:response])
    @invite.save
    redirect_to invite_path(@invite)
  end

  def destroy
  end

  private

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

end
