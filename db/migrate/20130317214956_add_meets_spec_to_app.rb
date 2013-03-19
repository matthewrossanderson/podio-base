class AddMeetsSpecToApp < ActiveRecord::Migration
  def change
    add_column :apps, :meets_spec, :boolean, :default => false
  end
end
