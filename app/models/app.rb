class App < ActiveRecord::Base
  belongs_to :workspace
  has_many :fields
  attr_accessible :id, :name
end
