class UserCalification < ActiveRecord::Migration
  def change
  	  	add_column :user_califications, :user_id, :integer
  end
end
