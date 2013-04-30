class AnimalPresenter
  attr_reader :animal, :current_user

  def initialize(animal, current_user)
    @animal = animal
    @current_user = current_user
  end

  def to_json(options)
    {
      :alias => animal.alias,
      :left_antler_id => animal.left_antler.id,
      :right_antler_id => animal.right_antler.id,
      :certification => animal.certification,
      :id => animal.id,
      :editable => animal.editable_by?(current_user),
      :kind => animal.kind,
      :spread_greatest_whole => animal.spread_greatest_whole,
      :spread_greatest_fraction => animal.spread_greatest_fraction,
      :spread_inside_whole => animal.spread_inside_whole,
      :spread_inside_fraction => animal.spread_inside_fraction,
      :spread_tip_whole => animal.spread_tip_whole,
      :spread_tip_fraction => animal.spread_tip_fraction,
      :state => animal.state
    }.to_json
  end
end
