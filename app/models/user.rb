class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :username, :password, :password_confirmation, :password_digest

  has_secure_password

  has_many :animals, :through => :roles
  has_many :antlers, :through => :roles

end
