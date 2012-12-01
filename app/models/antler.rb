class Antler < ActiveRecord::Base

  belongs_to :animal
  has_many :points

  attr_accessible :animal_id, :parent_id, :certification, :image, :side, :kind, :state,
  	:lg_mainbeam, :lg_mainbeam_whole, :lg_mainbeam_fraction,
  	:lg_one, :lg_one_whole, :lg_one_fraction,
  	:lg_two, :lg_two_whole, :lg_two_fraction,
  	:lg_three, :lg_three_whole, :lg_three_fraction,
  	:lg_four, :lg_four_whole, :lg_four_fraction,
  	:lg_five, :lg_five_whole, :lg_five_fraction,
  	:lg_six, :lg_six_whole, :lg_six_fraction,
  	:lg_seven, :lg_seven_whole, :lg_seven_fraction,
  	:circ_one, :circ_one_whole, :circ_one_fraction,
  	:circ_two, :circ_two_whole, :circ_two_fraction,
  	:circ_three, :circ_three_whole, :circ_three_fraction,
  	:circ_four, :circ_four_whole, :circ_four_fraction

  attr_accessor :lg_mainbeam_whole, :lg_mainbeam_fraction,
  	:lg_one_whole, :lg_one_fraction,
  	:lg_two_whole, :lg_two_fraction,
  	:lg_three_whole, :lg_three_fraction,
  	:lg_four_whole, :lg_four_fraction,
  	:lg_five_whole, :lg_five_fraction,
  	:lg_six_whole, :lg_six_fraction,
  	:lg_seven_whole, :lg_seven_fraction,
  	:circ_one_whole, :circ_one_fraction,
  	:circ_two_whole, :circ_two_fraction,
  	:circ_three_whole, :circ_three_fraction,
  	:circ_four_whole, :circ_four_fraction

  def calculate_lg_value
    self.lg_mainbeam  =    (@lg_mainbeam_whole.to_i * 8) + @lg_mainbeam_fraction.to_i
    self.lg_one       =         (@lg_one_whole.to_i * 8) + @lg_one_fraction.to_i
    self.lg_two       =         (@lg_two_whole.to_i * 8) + @lg_two_fraction.to_i
    self.lg_three     =       (@lg_three_whole.to_i * 8) + @lg_three_fraction.to_i
    self.lg_four      =        (@lg_four_whole.to_i * 8) + @lg_four_fraction.to_i
    self.lg_five      =        (@lg_five_whole.to_i * 8) + @lg_five_fraction.to_i
    self.lg_six       =         (@lg_six_whole.to_i * 8) + @lg_six_fraction.to_i
    self.lg_seven     =       (@lg_seven_whole.to_i * 8) + @lg_seven_fraction.to_i
    self.circ_one     =       (@circ_one_whole.to_i * 8) + @circ_one_fraction.to_i
    self.circ_two     =       (@circ_two_whole.to_i * 8) + @circ_two_fraction.to_i
    self.circ_three   =     (@circ_three_whole.to_i * 8) + @circ_three_fraction.to_i
    self.circ_four    =      (@circ_four_whole.to_i * 8) + @circ_four_fraction.to_i
  end

  def lg_mainbeam_whole
    lg_mainbeam.to_i / 8
  end
  
  def lg_mainbeam_fraction
    lg_mainbeam.to_i % 8
  end

  def lg_one_whole
    lg_one.to_i / 8
  end
  
  def lg_one_fraction
    lg_one.to_i % 8
  end

  def lg_two_whole
  	lg_two.to_i / 8
  end

  def lg_two_fraction
  	lg_two.to_i % 8
  end

  def lg_thre_whole
  	lg_three.to_i / 8
  end

  def lg_three_fraction
  	lg_three.to_i % 8
  end

  def lg_four_whole
  	lg_four.to_i / 8
  end

  def lg_four_fraction
  	lg_four.to_i % 8
  end

  def lg_five_whole
  	lg_five.to_i / 8
  end

  def lg_five_fraction
  	lg_five.to_i % 8
  end

  def lg_six_whole
  	lg_six.to_i / 8
  end

  def lg_six_fraction
  	lg_six.to_i % 8
  end

  def lg_seven_whole
  	lg_seven.to_i / 8
  end

  def lg_seven_fraction
  	lg_seven.to_i % 8
  end

  def circ_one_whole
  	circ_one.to_i / 8
  end

  def circ_one_fraction
  	circ_one.to_i % 8
  end

  def circ_two_whole
  	circ_two.to_i / 8
  end

  def circ_two_fraction
  	circ_two.to_i % 8
  end

  def circ_three_whole
  	circ_three.to_i / 8
  end

  def circ_three_fraction
  	circ_three.to_i % 8
  end

  def circ_four_whole
  	circ_four.to_i / 8
  end

  def circ_four_fraction
  	circ_four.to_i % 8
  end

end
