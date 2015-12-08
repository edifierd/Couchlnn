class CreateUserCalifications < ActiveRecord::Migration
  def change
    create_table :user_califications do |t|
      t.integer :puntaje
      t.datetime :fecha
      t.string :comentario

      t.timestamps null: false
    end
  end
end
