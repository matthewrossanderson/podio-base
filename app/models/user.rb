class User < ActiveRecord::Base

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["info"]["user_id"]
      user.email = auth["info"]["email"]
      if auth["provider"] == "podio"
        Podio.setup(
          :api_url => 'https://api.podio.com',
          :api_key => ENV['PODIO_CLIENT_ID'],
          :api_secret => ENV['PODIO_CLIENT_SECRET'],
          :oauth_token => Podio::OAuthToken.new('access_token' => auth["credentials"]["token"], 'refresh_token' => auth["credentials"]["refresh_token"])
        )
      	profile = Podio::Profile.find_for_user(user.uid)
      	user.name = profile.name
      	user.thumbnail_url = profile.image["thumbnail_link"]
      end
    end
  end

end
