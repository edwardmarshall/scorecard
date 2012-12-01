class Point < ActiveRecord::Base
  attr_accessible :antler_id, :lg_point, :lg_point_whole, :lg_point_fraction

  attr_accessor :lg_point_whole, :lg_point_fraction

  belongs_to :antler

  before_save :calculate_values

  def calculate_values
  	self.lg_point = (@lg_point_whole.to_i * 8) + @lg_point_fraction.to_i
  end

  def lg_point_whole
  	lg_point.to_i / 8
  end

  def lg_point_fraction
  	lg_point.to_i % 8
  end

end
