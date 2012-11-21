class Antler < ActiveRecord::Base
  attr_accessible :animal_id, :certification, :circ_four, :circ_one, :circ_three, :circ_two, :image, :lg_five, :lg_four, :lg_mainbeam, :lg_one, :lg_seven, :lg_six, :lg_three, :lg_two, :parent_id, :side

  belongs_to :animal

  has_many :points
  has_many :users, :through => :roles

end
