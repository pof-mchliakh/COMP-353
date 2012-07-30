class Person < ActiveRecord::Base
  attr_accessible :address_id, :apt, :first_name, :last_name, :street_number, :telephone
end
