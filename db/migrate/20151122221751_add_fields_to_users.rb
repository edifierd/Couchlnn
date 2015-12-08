class AddFieldsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :genre, :string
    add_column :users, :age, :integer
    add_column :users, :avatar_img, :string
    add_column :users, :secret_question, :string
    remove_column :users, :premium
  end
end
