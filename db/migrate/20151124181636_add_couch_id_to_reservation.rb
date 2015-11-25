class AddCouchIdToReservation < ActiveRecord::Migration
  def change
  	add_column :reservations, :couch_id, :integer
  end
end
