class Address < ActiveRecord::Base
  has_many :people
  attr_accessible :city, :postal_code, :street_name

  def full
    "#{street_name}, #{city}, #{postal_code}"
  end
end
