class AddSecretQuestionToUser < ActiveRecord::Migration
  def change
  	    add_column :users, :secret_question, :string
  end
end
