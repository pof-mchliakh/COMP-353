class Driver < ActiveRecord::Base
  belongs_to :person
  has_many :missions
  attr_accessible :person_id, :license_type_id

  def full_name
    person.full_name
  end
end
