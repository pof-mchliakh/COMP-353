class Truck < ActiveRecord::Base
  belongs_to :truck_type
  has_many :missions
  attr_accessible :truck_type_id

  def truck_type_name
    truck_type.name
  end
end
