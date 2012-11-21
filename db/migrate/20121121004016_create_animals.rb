class CreateAnimals < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.string :kind
      t.string :image
      t.string :state
      t.string :region
      t.string :unit
      t.string :hunter
      t.integer :spread_tip
      t.integer :spread_greatest
      t.integer :spread_inside
      t.string :alias
      t.string :certification

      t.timestamps
    end
  end
end
