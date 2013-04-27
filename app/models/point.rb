class Point < ActiveRecord::Base

  belongs_to :antler

  attr_accessible :antler_id, :lg_point, :lg_point_whole, :lg_point_fraction

  attr_accessor :lg_point_whole, :lg_point_fraction

  def calculate_lg_value
    self.lg_point = (@lg_point_whole.to_i * 8) + @lg_point_fraction.to_i
  end

  def lg_point_whole
    lg_point.to_i / 8
  end

  def lg_point_fraction
    lg_point.to_i % 8
  end

end
