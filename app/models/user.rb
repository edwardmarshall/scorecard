class User < ActiveRecord::Base
  has_many :roles
  has_many :animals, :through => :roles

  attr_accessible :email,
    :first_name,
    :last_name,
    :username,
    :password,
    :password_confirmation,
    :password_digest,
    :phone,
    :facebook_token,
    :facebook_token_expiration

  has_secure_password
  validates_presence_of :email, :username
  validates_uniqueness_of :email, :username

  def full_name
    first_name + " " + last_name
  end

  def scoreable_animals
    self.animals.select(&:scoreable?)
  end
end
