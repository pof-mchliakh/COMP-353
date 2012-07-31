class Person < ActiveRecord::Base
  belongs_to :address
  attr_accessible :address_id, :apt, :first_name, :last_name, :street_number, :telephone
end
