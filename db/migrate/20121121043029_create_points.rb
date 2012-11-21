class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.integer :antler_id
      t.integer :lg_point

      t.timestamps
    end
  end
end
