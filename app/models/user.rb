class User < ActiveRecord::Base
  
  has_many :animals, :through => :roles

  attr_accessible :email, :first_name, :last_name, :username, :password, :password_confirmation, :password_digest, :phone

  has_secure_password

end
