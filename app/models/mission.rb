class Mission < ActiveRecord::Base
  belongs_to :truck
  belongs_to :driver
  attr_accessible :driver_id, :expected_end_time, :expected_start_time, :truck_id, :reservation_id
end
