class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :prep_application
    	t.string	:from
    	t.string	:to
    	t.string	:subject
    	t.string	:body
    	t.string	:message_type
    	t.string	:attachment

      t.timestamps
    end
  end
end