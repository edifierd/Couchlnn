class AddReservation < ActiveRecord::Migration
  def change
  	  	add_column :reservations, :user_calification, :boolean, default: false
  	  	add_column :reservations, :couch_calification, :boolean, default: false
  end
end
