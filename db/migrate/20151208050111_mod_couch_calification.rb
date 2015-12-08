class ModCouchCalification < ActiveRecord::Migration
  def change
  	  	remove_column :couch_califications, :integer
  	  	remove_column :couch_califications, :puntaje

  	  	add_column :couch_califications, :puntaje, :integer

  end
end
