class CambiarDatetimeporDateCouch < ActiveRecord::Migration
  def change
  	add_column :couches, :avivable_in_date, :Date
  	add_column :couches, :avivable_out_date, :Date
  	remove_column :couches, :init_date
  	remove_column :couches, :out_date
  end
end
