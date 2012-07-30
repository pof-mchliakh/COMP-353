class Truck < ActiveRecord::Base
  has_many :truck_types
  attr_accessible :truck_type_id
end
