class AddCapacityToCouch < ActiveRecord::Migration
  def change
    add_column :couches, :capacity, :integer
  end
end
