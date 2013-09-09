class AddPaymentFieldToUser < ActiveRecord::Migration
  def up
  	add_column :profiles, :card_number, 		:string
  	add_column :profiles, :payment_method, 	:string
  	add_column :profiles, :expire_date, 		:datetime
  	add_column :profiles, :ccvn, 						:string
  end

  def down
		remove_column :profiles, :card_number
		remove_column :profiles, :payment_method
		remove_column :profiles, :expire_date
		remove_column :profiles, :ccvn
  end
end