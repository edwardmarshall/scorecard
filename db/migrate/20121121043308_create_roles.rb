class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.integer :user_id
      t.integer :animal_id
      t.integer :antler_id
      t.string :title

      t.timestamps
    end
  end
end
