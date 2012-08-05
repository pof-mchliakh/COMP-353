class Reservation < ActiveRecord::Base
  belongs_to :address
  belongs_to :client
  has_many :missions
  
  attr_accessible :address_id, :appointment_date, :apt, :client_id, :expected_end_time, :street_number

  def description 
    "#{id} - #{address.full}"
  end

  def delete
    sql_command = [
        %Q^
            call delete_reservation(:reservation_id)
        ^, {:reservation_id => id}
    ]
    Reservation.execute(sql_command)
  end

  private     
  def self.sanitize_sql_array(array)
    ActiveRecord::Base.send(:sanitize_sql_array, array)
  end

  def self.execute(sql_command)
    ActiveRecord::Base.connection.execute( sanitize_sql_array(sql_command) )
  end
end
