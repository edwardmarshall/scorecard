class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :username

  has_many :animals, :through => :roles
  has_many :antlers, :through => :roles

end
