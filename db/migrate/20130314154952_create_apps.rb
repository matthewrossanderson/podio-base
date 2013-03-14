class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :name
      t.integer :id
      t.references :workspace

      t.timestamps
    end
    add_index :apps, :workspace_id
  end
end
