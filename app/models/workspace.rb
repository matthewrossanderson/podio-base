class Workspace < ActiveRecord::Base
  attr_accessible :id, :name
  has_many :apps
end
