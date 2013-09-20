class AddInterviewSessionToContract < ActiveRecord::Migration
  	def up
  	add_column :contracts, :session_id, :string
  	add_column :contracts, :token			, :string
  end

  def down
		remove_column :contracts, :session_id
		remove_column :contracts, :token
  end
end