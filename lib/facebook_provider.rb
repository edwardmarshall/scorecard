class FacebookProvider
  attr_accessor :oauth_data
  def initialize(oauth_data)
    self.oauth_data = oauth_data
  end

  def credentials
    token = oauth_data.credentials.token
    expiration = Time.at(oauth_data.credentials.expires_at)
    {
      :facebook_token => token,
      :facebook_token_expiration => expiration
    }
  end

  def existing_user
    User.find_by_email(email)
  end

  def email
    oauth_data.info.email
  end

  def user_create_data
    info = oauth_data.info
    username = info.name.downcase.gsub(' ', '-')
    {
      :username => username,
      :first_name => info.first_name,
      :last_name => info.last_name,
      :email => info.email,
      :password => rand(36**16).to_s(36),
      :facebook_token => token,
      :facebook_token_expiration => expiration
    }.merge(credentials)
  end
end
