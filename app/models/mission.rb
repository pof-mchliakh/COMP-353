class Mission < ActiveRecord::Base
  belongs_to :truck
  belongs_to :driver
  belongs_to :reservation
  belongs_to :mission_sheet
  attr_accessible :driver_id, :expected_end_time, :expected_start_time, :truck_id, :reservation_id

  def description 
    "#{id} - For reservation ( #{reservation_id} ) to #{reservation.address.full}"
  end
end
