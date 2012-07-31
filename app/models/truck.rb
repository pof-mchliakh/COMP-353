class Truck < ActiveRecord::Base
  belongs_to :truck_type
  has_many :missions
  attr_accessible :truck_type_id
end
