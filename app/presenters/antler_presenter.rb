class AntlerPresenter
  attr_reader :antler

  def initialize(antler)
    @antler = antler
  end

  def to_json(options)
    {
      :id => antler.id,
      :lg_mainbeam_whole => antler.lg_mainbeam_whole,
      :lg_mainbeam_fraction => antler.lg_mainbeam_fraction,
      :lg_one_whole => antler.lg_one_whole,
      :lg_one_fraction => antler.lg_one_fraction,
      :lg_two_whole => antler.lg_two_whole,
      :lg_two_fraction => antler.lg_two_fraction,
      :lg_three_whole => antler.lg_three_whole,
      :lg_three_fraction => antler.lg_three_fraction,
      :lg_four_whole => antler.lg_four_whole,
      :lg_four_fraction => antler.lg_four_fraction,
      :lg_five_whole => antler.lg_five_whole,
      :lg_five_fraction => antler.lg_five_fraction,
      :lg_six_whole => antler.lg_six_whole,
      :lg_six_fraction => antler.lg_six_fraction,
      :lg_seven_whole => antler.lg_seven_whole,
      :lg_seven_fraction => antler.lg_seven_fraction,
      :circ_one_whole => antler.circ_one_whole,
      :circ_one_fraction => antler.circ_one_fraction,
      :circ_two_whole => antler.circ_two_whole,
      :circ_two_fraction => antler.circ_two_fraction,
      :circ_three_whole => antler.circ_three_whole,
      :circ_three_fraction => antler.circ_three_fraction,
      :circ_four_whole => antler.circ_four_whole,
      :circ_four_fraction => antler.circ_four_fraction
    }.to_json
  end
end
