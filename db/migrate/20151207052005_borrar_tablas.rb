class BorrarTablas < ActiveRecord::Migration
  def change
  	drop_table :commontator_subscriptions
  	drop_table :commontator_threads

  end
end
