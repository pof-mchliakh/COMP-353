class Mission < ActiveRecord::Base
  belongs_to :truck
  attr_accessible :driver_id, :expected_end_time, :expected_start_time, :invoice_id, :truck_id, :reservation_id
end
