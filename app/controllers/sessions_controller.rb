class SessionsController < ApplicationController
  skip_before_filter :ensure_login

  def create
    auth = request.env["omniauth.auth"]
    user = User.find_by_provider_and_uid(auth["provider"], auth["info"]["user_id"]) || User.create_with_omniauth(auth)

    session[:user_id] = user.id
    session[:podio_access_token] = auth["credentials"]["token"]
    session[:podio_refresh_token] = auth["credentials"]["refresh_token"]

    redirect_to root_url, :notice => "Signed in!"
  end

  def destroy
    session.clear
    redirect_to root_url, :notice => "Logged out!"
  end

  def failure
    if params[:message]
      flash[:error] = "Error Logging in. Please try again or contact us if you still encounter difficulties." << message.html_safe
    end
    render :new
  end

end
