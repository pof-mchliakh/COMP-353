class Mission < ActiveRecord::Base
  attr_accessible :driver_id, :expected_end_time, :expected_start_time, :invoice_id, :truck_id
end
