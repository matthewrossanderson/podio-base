class CreateFields < ActiveRecord::Migration
  def change
    create_table :fields do |t|
      t.string :name
      t.integer :id
      t.references :app

      t.timestamps
    end
    add_index :fields, :app_id
  end
end
