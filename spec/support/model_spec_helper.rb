module ModelSpecHelper
  def init_podio_client
    Podio.setup(
      :api_url => 'https://api.podio.com',
      :api_key => ENV['PODIO_CLIENT_ID'],
      :api_secret => ENV['PODIO_CLIENT_SECRET'],
      :oauth_token => Podio::OAuthToken.new('access_token' => OmniAuth.config.mock_auth[:podio][:credentials][:token], 'refresh_token' => OmniAuth.config.mock_auth[:podio][:credentials][:refresh_token])
    )
  end
end