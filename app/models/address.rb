class Address < ActiveRecord::Base
  attr_accessible :streetName, :apt, :city, :postalcode, :created_at
end
