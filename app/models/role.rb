class Role < ActiveRecord::Base
  attr_accessible :animal_id, :antler_id, :title, :user_id, :animal, :user

  belongs_to :user
  belongs_to :animal

end
