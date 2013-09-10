class AddContractorsToContract < ActiveRecord::Migration
	def up
  	add_column :contracts, :prepper_id, :integer
  	add_column :contracts, :preppee_id, :integer
  end

  def down
		remove_column :contracts, :prepper_id
		remove_column :contracts, :preppee_id
  end
end