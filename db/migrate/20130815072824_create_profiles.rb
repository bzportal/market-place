class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.references :user
      t.string  :token
      t.string  :title
      t.string  :address
      t.string  :country
      t.string  :state
      t.string  :city
      t.string  :zipcode
      t.string  :phone
      t.decimal :feedback, default: 0
      t.integer :year_of_experience, default: 0
      t.string  :language, default: 0
      t.string  :overview, limit: 5000
      t.decimal :feedback
      t.attachment :photo
      
      t.timestamps
    end
  end
end