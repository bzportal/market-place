class CreateProExperiences < ActiveRecord::Migration
  def change
    create_table :pro_experiences do |t|
    	t.integer	:profile_id
    	t.string :title
    	t.string :company_name
    	t.string :location
    	t.string :from
    	t.string :to
    	t.string :description, limit: 5000
      t.timestamps
    end
  end
end