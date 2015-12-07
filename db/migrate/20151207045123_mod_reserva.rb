class ModReserva < ActiveRecord::Migration
  def change
  	remove_column :reservations, :confirmed
  	add_column :reservations, :estado, :string
  end
end
