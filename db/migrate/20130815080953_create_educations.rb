class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.references  :profile
      t.string 	:from
      t.string 	:to
      t.string 	:school
      t.integer :degree
      t.string 	:area_of_study
      t.string  :comments, limit: 5000
      t.timestamps
    end
  end
end
