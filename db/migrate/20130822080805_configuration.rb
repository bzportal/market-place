class Configuration < ActiveRecord::Migration
  def change
    create_table :language_skills do |t|
    	t.string	:name
    	
      t.timestamps
    end

    create_table :job_types do |t|
    	t.string	:name
    	
      t.timestamps
    end
  end
end