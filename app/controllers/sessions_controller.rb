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
    Rails.logger.info params
    Rails.logger.info request.env['omniauth.auth']

    oauth_data = request.env['omniauth.auth']
    provider = FacebookProvider.new(oauth_data)

    if current_user
      Rails.logger.info 'current user found'
      current_user.update_attributes(provider.credentials)
      redirect_to :root
    else
      if user = provider.existing_user
        Rails.logger.info 'existing user found'
        session[:user_id] = user.id # create new session, find the user.id and hold in the new session cookie as :user_id...
        redirect_to :root
      else
        Rails.logger.info 'create user from facebook'
        user = User.new(provider.user_create_data)
        if user.save
          Rails.logger.info 'user created from facebook'
          session[:user_id] = user.id # create new session, find the user.id and hold in the new session cookie as :user_id...
          redirect_to example_scorecards_path
        else
          Rails.logger.info "failed to create user from facebook: #{user.errors.full_messages}"
          redirect_to :root
        end
      end
    end

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
    UserMailer.reset_password(User.find_by_email(params[:email])).deliver
  end

  def change_password
  end
end
