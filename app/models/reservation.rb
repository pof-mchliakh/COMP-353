class Reservation < ActiveRecord::Base
  attr_accessible :address_id, :appointment_date, :client_id, :expected_end_time, :mission_id
end
