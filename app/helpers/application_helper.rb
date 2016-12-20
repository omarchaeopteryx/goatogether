module ApplicationHelper
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def format_time(datetime)
    datetime.strftime("%m/%-m/%y %l%P")
  end

  def users_tweets
    current_user.twitter.search
  end
end
