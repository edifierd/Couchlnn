class AddFechaDePagoUser < ActiveRecord::Migration
  def change
  	  	add_column :users, :fechaPago, :datetime
  end
end
