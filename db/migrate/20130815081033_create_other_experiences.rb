class CreateOtherExperiences < ActiveRecord::Migration
  def change
    create_table :other_experiences do |t|
    	t.references 	:profile
    	t.string	:name
    	t.string	:description, limit: 5000
    	
      t.timestamps
    end
  end
end