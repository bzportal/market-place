class CreateSkillTags < ActiveRecord::Migration
  def change
    create_table :skill_tags do |t|
    	t.string :name
    	
      t.timestamps
    end
  end
end
