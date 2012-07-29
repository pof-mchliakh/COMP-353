class Address < ActiveRecord::Base
  attr_accessible :city, :postal_code, :street_name
end
