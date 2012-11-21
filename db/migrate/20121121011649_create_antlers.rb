class CreateAntlers < ActiveRecord::Migration
  def change
    create_table :antlers do |t|
      t.integer :animal_id
      t.integer :parent_id
      t.string :image
      t.string :certification
      t.integer :lg_mainbeam
      t.integer :lg_one
      t.integer :lg_two
      t.integer :lg_three
      t.integer :lg_four
      t.integer :lg_five
      t.integer :lg_six
      t.integer :lg_seven
      t.integer :circ_one
      t.integer :circ_two
      t.integer :circ_three
      t.integer :circ_four
      t.string :side

      t.timestamps
    end
  end
end
