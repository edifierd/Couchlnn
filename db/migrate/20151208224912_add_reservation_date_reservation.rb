class AddReservationDateReservation < ActiveRecord::Migration
  def change
  	add_column :reservations, :reservation_date, :date
  end
end
