class CreatePreps < ActiveRecord::Migration
  def change
    create_table :preps do |t|
      t.integer :user_id
      t.integer :product_id
      t.string  :title
    	t.string	:prep_type
    	t.integer	:job_type_id
    	t.string	:required_skills
    	t.string	:description, limit: 5000
      t.string  :status
    	t.attachment :attachment_url

      t.timestamps
    end
  end
end
