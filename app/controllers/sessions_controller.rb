class SessionsController < ApplicationController
  def create
    @user = User.find_or_create_from_auth_hash(auth_hash)
    session[:user_id] = @user.id
    session[:count] = -1 # Add a counter to only run default search upon first visit. Note that we start at negative one because auth runs load twice.
    redirect_to '/'
  end

  def logout
    reset_session
    redirect_to '/'
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
