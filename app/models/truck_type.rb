class TruckType < ActiveRecord::Base
  has_many :trucks
  attr_accessible :name
end
