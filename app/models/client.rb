class Client < ActiveRecord::Base
  has_many :reservations
  belongs_to :person
  attr_accessible :person_id
  
  def full_name
    person.full_name
  end
end
