class AddKindtoAntlers < ActiveRecord::Migration

	def change
		add_column :antlers, :kind, :string
	end
	
end
