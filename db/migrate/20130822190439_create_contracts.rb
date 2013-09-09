class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
    	t.references   :prep_application
      t.string      :due_start_date
      t.string      :due_start_time
      t.datetime    :due_end_time
      t.datetime    :start_time
      t.datetime    :end_time
      t.integer     :duration
      t.decimal     :amount
      t.string      :status
      t.integer     :feedback
      t.string      :comments, limit: 5000

      t.timestamps
    end
  end
end