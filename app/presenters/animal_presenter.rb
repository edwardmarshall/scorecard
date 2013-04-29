class AnimalPresenter
  attr_reader :animal

  def initialize(animal)
    @animal = animal
  end

  def to_json(options)
    {
      :alias => animal.alias,
      :certification => animal.certification,
      :id => 1,
      :kind => animal.kind,
      :spread_greatest_whole => animal.spread_greatest_whole,
      :spread_greatest_fraction => animal.spread_greatest_fraction,
      :spread_inside_whole => animal.spread_inside_whole,
      :spread_inside_fraction => animal.spread_inside_fraction,
      :spread_tip_whole => animal.spread_tip_whole,
      :spread_tip_fraction => animal.spread_tip_fraction,
      :state => "ut"
    }.to_json
  end
end
