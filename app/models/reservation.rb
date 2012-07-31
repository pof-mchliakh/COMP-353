class Reservation < ActiveRecord::Base
  belongs_to :address
  attr_accessible :address_id, :appointment_date, :apt, :client_id, :expected_end_time, :street_number
end
