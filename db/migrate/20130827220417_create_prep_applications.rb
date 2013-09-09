class CreatePrepApplications < ActiveRecord::Migration
  def change
    create_table :prep_applications do |t|
    	t.integer	:user_id #prepper_id
    	t.integer	:prep_id
    	t.string	:cover_letter
    	t.string	:status

      t.timestamps
    end
  end
end