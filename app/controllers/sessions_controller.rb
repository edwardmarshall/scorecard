class SessionsController < ApplicationController
  def new
    redirect_to :scorecards if current_user
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password]) # if user email AND password matches a record in our user model...
      session[:user_id] = user.id # create new session, find the user.id and hold in the new session cookie as :user_id...
      redirect_to root_url # and redirect_to the specified route.
    else
      render 'new' # re-render the new session (login) page.
    end
  end

  def oauth
    Rails.logger.info request.env['omniauth.auth']

    token = request.env['omniauth.auth'].credentials.token
    expiration = Time.at(request.env['omniauth.auth'].credentials.expires_at)

    current_user.update_attributes(:facebook_token => token, :facebook_token_expiration => expiration)
    redirect_to :root
  end

  def sign_up
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to example_scorecards_path
    else
      render 'new'
    end
  end

  def destroy
    reset_session # rails method so not defined by us. Takes everything inside the session[] hash and makes it return 'nil'
    redirect_to root_url
  end

  def reset_password

  end

  def change_password
  end
end
