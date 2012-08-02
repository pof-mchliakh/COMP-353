class Person < ActiveRecord::Base
  belongs_to :address
  belongs_to :driver
  belongs_to :client
  attr_accessible :address_id, :apt, :first_name, :last_name, :street_number, :telephone

  def full_name
    "#{first_name} #{last_name}"
  end
end
