class Animal < ActiveRecord::Base
  attr_accessible :alias, :certification, :hunter, :image, :kind, :region, :spread_greatest, :spread_inside, :spread_tip, :state, :unit

  has_many :antlers
  has_many :users, :through => :roles

end
