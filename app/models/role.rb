class Role < ActiveRecord::Base
  attr_accessible :animal_id, :antler_id, :title, :user_id

  belongs_to :user
  belongs_to :animal
  belongs_to :antler

end
