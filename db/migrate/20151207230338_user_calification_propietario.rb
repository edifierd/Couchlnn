class UserCalificationPropietario < ActiveRecord::Migration
  def change
  	  add_column :user_califications, :user_id_propietario, :integer
  end
end
