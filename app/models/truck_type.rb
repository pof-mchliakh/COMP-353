class TruckType < ActiveRecord::Base
  belongs_to :truck
  attr_accessible :name
end
