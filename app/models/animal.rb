class Animal < ActiveRecord::Base
 
  has_many :antlers
  has_many :roles
  has_many :users, :through => :roles

  attr_accessible :alias, :certification, :hunter, :image, :kind, :region, :state, :unit, :contributor, :user_id,
    :spread_tip, :spread_tip_whole, :spread_tip_fraction,
    :spread_greatest, :spread_greatest_whole, :spread_greatest_fraction,
    :spread_inside, :spread_inside_whole, :spread_inside_fraction # <-- These guys have permission to be mass assigned
  
  attr_accessor :spread_tip_whole, :spread_tip_fraction, :spread_greatest_whole, :spread_greatest_fraction, :spread_inside_whole, :spread_inside_fraction, :user_id
  
  def calculate_lg_value
    self.spread_tip       =        (@spread_tip_whole.to_i * 8) + @spread_tip_fraction.to_i
    self.spread_greatest  =   (@spread_greatest_whole.to_i * 8) + @spread_greatest_fraction.to_i
    self.spread_inside    =     (@spread_inside_whole.to_i * 8) + @spread_inside_fraction.to_i
  end

  def scoreable?
    antlers.count == 2
  end

# --- defining the methods for re-populating the form when edit page is requested
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


# --- defining foriegn relationships
  def right_antler
    self.antlers.find_by_side("right")
  end

  def left_antler
    self.antlers.find_by_side("left")
  end

  def hunter
    role = roles.find_by_title("hunter")
    role.user
  end

# --- defining for score calculator
  def longest_antler_mainbeam
    if right_antler.lg_mainbeam.to_i >= left_antler.lg_mainbeam.to_i
      return right_antler.lg_mainbeam.to_i
    else
      left_antler.lg_mainbeam.to_i
    end
  end

  def spread_credit
    if antlers.count < 2
        return 0
    end
    
    if spread_inside.to_i <= longest_antler_mainbeam.to_i
      return spread_inside.to_i
    else
      longest_antler_mainbeam.to_i
    end
  end

  def lg_points
    right_antler.lg_points + left_antler.lg_points
  end

  # --- calculating difference
  def dif_mb
    (right_antler.lg_mainbeam.to_i - left_antler.lg_mainbeam.to_i).abs
  end

  def dif_g1
    (right_antler.lg_one.to_i - left_antler.lg_one.to_i).abs
  end

  def dif_g2
    (right_antler.lg_two.to_i - left_antler.lg_two.to_i).abs
  end

  def dif_g3
    (right_antler.lg_three.to_i - left_antler.lg_three.to_i).abs
  end

  def dif_g4
    (right_antler.lg_four.to_i - left_antler.lg_four.to_i).abs
  end

  def dif_g5
    (right_antler.lg_five.to_i - left_antler.lg_five.to_i).abs
  end

  def dif_g6
    (right_antler.lg_six.to_i - left_antler.lg_six.to_i).abs
  end

  def dif_g7
    (right_antler.lg_seven.to_i - left_antler.lg_seven.to_i).abs
  end

  def dif_c1
    (right_antler.circ_one.to_i - left_antler.circ_one.to_i).abs
  end

  def dif_c2
    (right_antler.circ_two.to_i - left_antler.circ_two.to_i).abs
  end

  def dif_c3
    (right_antler.circ_three.to_i - left_antler.circ_three.to_i).abs
  end

  def dif_c4
    (right_antler.circ_four.to_i - left_antler.circ_four.to_i).abs
  end

  def difference
    dif_mb + dif_g1 + dif_g2 + dif_g3 + dif_g4 + dif_g5 + dif_g6 + dif_g7 + dif_c1 + dif_c2 + dif_c3 + dif_c4
  end

  def typical_difference
    difference + lg_points
  end

  # --- calculating total scores
  def subtotal_score
    spread_credit.to_i + right_antler.lg_antler + left_antler.lg_antler
  end

  def subtotal2_score # --- used in nontypical calculation
    subtotal_score - difference
  end

  def typical_score
    subtotal_score - typical_difference
  end
  
  def nontypical_score
    subtotal2_score + lg_points
  end
# --- calculating gross for reference
  def gross_score
    spread_credit.to_i + (right_antler.lg_antler + right_antler.lg_points.to_i) + (left_antler.lg_antler + left_antler.lg_points.to_i)
  end

end
