class AddLocationToCouch < ActiveRecord::Migration
  def change
    add_column :couches, :location, :string
  end
end
