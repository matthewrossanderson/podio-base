class CreateFields < ActiveRecord::Migration
  def change
    create_table :fields do |t|
      t.string :label
      t.integer :id
      t.boolean :required
      t.references :app

      t.timestamps
    end
    add_index :fields, :app_id
  end
end
