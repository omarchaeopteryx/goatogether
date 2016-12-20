class User < ApplicationRecord
  has_many :journeys
  has_many :invites, {foreign_key: :guest_id}

  validates :uid, uniqueness: true

  #look up the user or create the user using the auth hash
  def self.find_or_create_from_auth_hash(auth_hash)
    user = where(provider: auth_hash.provider, uid: auth_hash.uid).first_or_create
    user.update(
      name: auth_hash.info.name
      )
    user
  end

  def twitter
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['CONSUMER_KEY']
      config.consumer_secret = ENV["CONSUMER_SECRET"]
      config.access_token = ENV["YOUR_ACCESS_TOKEN"]
      config.access_token_secret = ENV["YOUR_ACCESS_SECRET"]
    end
  end
end
