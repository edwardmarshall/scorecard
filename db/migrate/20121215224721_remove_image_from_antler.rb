class RemoveImageFromAntler < ActiveRecord::Migration
  def up
  		remove_column :antlers, :image
  end

  def down
  		add_column :antlers, :image, :string
  end
end
