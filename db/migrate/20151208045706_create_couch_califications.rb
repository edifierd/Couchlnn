class CreateCouchCalifications < ActiveRecord::Migration
  def change
    create_table :couch_califications do |t|
      t.integer :puntaje
      t.datetime :fecha
      t.integer :couch_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
