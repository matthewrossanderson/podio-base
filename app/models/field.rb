class Field < ActiveRecord::Base
  belongs_to :app
  attr_accessible :id, :label, :required
end
