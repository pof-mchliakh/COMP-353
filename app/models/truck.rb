class Truck < ActiveRecord::Base
  belongs_to :truck_type
  attr_accessible :truck_type_id
end
