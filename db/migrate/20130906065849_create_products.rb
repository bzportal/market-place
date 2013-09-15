class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
    	t.string :name
    	t.decimal	:price
    	t.integer	:product_type # 
    	t.integer	:session_type
    	t.integer	:session_length
    	t.attachment :cover
    	t.attachment :book_url
      t.string  :description, limit: 5000
    	
      t.timestamps
    end
  end
end