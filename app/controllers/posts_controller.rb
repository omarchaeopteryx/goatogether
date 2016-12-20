class PostsController < ApplicationController

  def index

    # We will definitely want to clean this up:
    Instagram.client_id = ENV["INSTA_CLIENT_ID"]
    Instagram.client_secret = ENV["INSTA_CLIENT_SECRET"]
    client = Instagram.client(:access_token =>    ENV["INSTA_ACCESSS_TOKEN_OM"])

    # Preparing the variables for display:
    @instuser = client.user
    @tags = client.tag_search('goatogether')
    @images = client.tag_recent_media(@tags[0].name)

    # Preparing for future data use by storing url and location:
    @latlongs = Hash.new
    @images.each do |media_item|
        @latlongs[:url]=media_item.images.thumbnail.url
        @latlongs[:loc] = media_item.location
    end

    render :index
  end

end
