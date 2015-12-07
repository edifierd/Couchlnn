class CampoPagoAUser < ActiveRecord::Migration
  def change
  	add_column :users, :pago, :integer
  end
end
