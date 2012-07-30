class Reservation < ActiveRecord::Base
  attr_accessible :address_id, :appointment_date, :apt, :client_id, :expected_end_time, :mission_id, :street_number
end
