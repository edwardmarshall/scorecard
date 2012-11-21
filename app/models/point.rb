class Point < ActiveRecord::Base
  attr_accessible :antler_id, :lg_point

  belongs_to :antler

end
