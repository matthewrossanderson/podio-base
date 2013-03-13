class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :ensure_login, :profile_setup

  protected

    def ensure_login
      if session[:podio_refresh_token]
        init_podio_client
      else
        redirect_to new_session_path
      end
    end

    def init_podio_client
      Podio.setup(
        :api_url => 'https://api.podio.com',
        :api_key => ENV['PODIO_CLIENT_ID'],
        :api_secret => ENV['PODIO_CLIENT_SECRET'],
        :oauth_token => Podio::OAuthToken.new('access_token' => session[:podio_access_token], 'refresh_token' => session[:podio_refresh_token])
      )
    end

    def profile_setup
      if session[:user_id]
        user = User.find_by_id(session[:user_id])
        @user_name = user.name
        @user_thumbnail_url = user.thumbnail_url
      end
    end

    def api_health
      api = Podio.connection.get('/org/').env[:response_headers]
      ( api["x-rate-limit-remaining"].to_i * 100.0 ) / ( api["x-rate-limit-limit"].to_i * 100.0 ) * 100.0
    end
    
end
