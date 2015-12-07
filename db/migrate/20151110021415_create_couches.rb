class CreateCouches < ActiveRecord::Migration
  def change
    create_table :couches do |t|
      t.string :titulo
      t.string :descripcion
      t.integer :couch_type_id
      t.datetime :init_date
      t.datetime :out_date
      t.boolean :enable
      t.integer :user_id
      t.string :url_foto

      t.timestamps null: false
    end
  end
end
