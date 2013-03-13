module ControllerSpecHelper  
  def mock_session
  	session[:podio_access_token] = OmniAuth.config.mock_auth[:podio][:credentials][:token]
  	session[:podio_refresh_token] = OmniAuth.config.mock_auth[:podio][:credentials][:refresh_token]
  end

end