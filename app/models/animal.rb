class Animal < ActiveRecord::Base
  attr_accessible :alias, :certification, :hunter, :image, :kind, :region, :state, :unit,
    :spread_tip, :spread_tip_whole, :spread_tip_fraction,
    :spread_greatest, :spread_greatest_whole, :spread_greatest_fraction,
    :spread_inside, :spread_inside_whole, :spread_inside_fraction
  
  attr_accessor :spread_tip_whole, :spread_tip_fraction, :spread_greatest_whole, :spread_greatest_fraction, :spread_inside_whole, :spread_inside_fraction
  
  has_many :antlers
  has_many :users, :through => :roles
  
  before_save :calculate_spread_values

  def calculate_spread_values
    self.spread_tip = (self.spread_tip_whole.to_i * 8) + self.spread_tip_fraction.to_i
    self.spread_greatest = (self.spread_greatest_whole.to_i * 8) + self.spread_greatest_fraction.to_i
    self.spread_inside = (self.spread_inside_whole.to_i * 8) + self.spread_inside_fraction.to_i
  end

  
# --- Defining the methods for re-populating the form_for when edit page is requested
  def spread_tip_whole
    spread_tip.to_i / 8
  end

  def spread_tip_fraction
    spread_tip.to_i % 8
  end

  def spread_greatest_whole
    spread_greatest.to_i / 8
  end

  def spread_greatest_fraction
    spread_greatest.to_i % 8
  end

  def spread_inside_whole
    spread_inside.to_i / 8
  end

  def spread_inside_fraction
    spread_inside.to_i % 8
  end


# --- Defining additional 
  def right_antler
  	@total_size
  	@count_points
  	@lg_points
  end

  def left_antler
  	@total_size
  	@count_points
  	@lg_points
  end

  def spread_credit
  	@spread_credit
  end

  def score
  	@typical
  	@nontypical
  end

end
