# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

# This seed file reads from two csvs - app names/ids, fieldnames/ids
# and loads them into the database

# App.delete_all
# Field.delete_all

# open(File.join(Rails.root, 'db', "app_seed.csv")).read.each_line do |app|
#   id, name = app.chomp.split(",")
#   a = App.create!(:id => id, :name => name)
# end

# open(File.join(Rails.root, 'db', "field_seed.csv")).read.each_line do |field|
#   app_id, id, name = field.chomp.split(",")
#   next if app_id.nil?
#   f = Field.create!(:app_id=> app_id, :id => id, :name => name)
# end

