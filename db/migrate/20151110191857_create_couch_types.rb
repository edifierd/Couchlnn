class CreateCouchTypes < ActiveRecord::Migration
  def change
    create_table :couch_types do |t|
      t.string :titulo
      t.string :descripcion
      t.boolean :enabled

      t.timestamps null: false
    end
  end
end
