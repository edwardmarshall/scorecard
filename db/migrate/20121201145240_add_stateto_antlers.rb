class AddStatetoAntlers < ActiveRecord::Migration

	def change
		add_column :antlers, :state, :string
	end
	
end
