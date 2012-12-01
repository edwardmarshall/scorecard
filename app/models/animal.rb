class Animal < ActiveRecord::Base
 
  has_many :antlers
  has_many :users, :through => :roles

  attr_accessible :alias, :certification, :hunter, :image, :kind, :region, :state, :unit, :contributor,
    :spread_tip, :spread_tip_whole, :spread_tip_fraction,
    :spread_greatest, :spread_greatest_whole, :spread_greatest_fraction,
    :spread_inside, :spread_inside_whole, :spread_inside_fraction
  
  attr_accessor :spread_tip_whole, :spread_tip_fraction, :spread_greatest_whole, :spread_greatest_fraction, :spread_inside_whole, :spread_inside_fraction
  
  def calculate_lg_value
    self.spread_tip       =        (@spread_tip_whole.to_i * 8) + @spread_tip_fraction.to_i
    self.spread_greatest  =   (@spread_greatest_whole.to_i * 8) + @spread_greatest_fraction.to_i
    self.spread_inside    =     (@spread_inside_whole.to_i * 8) + @spread_inside_fraction.to_i
  end

# --- Defining the methods for re-populating the form when edit page is requested
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
    self.antlers.find_by_side("right")
  end

  def left_antler
    self.antlers.find_by_side("left")
  end

  def longest_antler_mainbeam
    if right_antler.lg_mainbeam >= left_antler.lg_mainbeam
      return right_antler.lg_mainbeam
    else
      left_antler.lg_mainbeam
    end
  end

  def spread_credit
    if antlers.count < 2
        return 0
    end
    
    if spread_inside <= longest_antler_mainbeam
      return spread_inside
    else
      longest_antler_mainbeam
    end
  end

  def dif_antler
    (right_antler.lg_antler - left_antler.lg_antler).abs
  end

  def lg_points
    right_antler.lg_points + left_antler.lg_points
  end

  def subtotal_score
    subtotal = spread_credit + right_antler.lg_antler + left_antler.lg_antler
    subtotal - dif_antler
  end

  def typical_score
      subtotal_score + lg_points
  end
  
  def nontypical_score
      subtotal_score - lg_points
  end

end
