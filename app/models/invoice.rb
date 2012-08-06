class Invoice < ActiveRecord::Base  
  has_many :payments
  attr_accessible :date, :reservation_id

  def total_no_tax
    sql_command = [
        %Q^
            SELECT IFNULL(reservation_total_cost_no_tax(:reservation_id), 0);
        ^, {:reservation_id => reservation_id}
    ]
    Invoice.execute(sql_command).first[0]
  end

  def tvq
    sql_command = [
        %Q^
            SELECT IFNULL(select_tax(:date, 'tvq'), 0);
        ^, {:date => date}
    ]
    Invoice.execute(sql_command).first[0] * total_no_tax
  end

  def tps
    sql_command = [
        %Q^
            SELECT IFNULL(select_tax(:date, 'tps'), 0);
        ^, {:date => date}
    ]
    Invoice.execute(sql_command).first[0] * total_no_tax
  end

  def total
    total_no_tax + tvq + tps
  end

  def remaining
    sql_command = [
        %Q^
            SELECT IFNULL(reservation_total_cost_paid(:reservation_id), 0);
        ^, {:reservation_id => reservation_id}
    ]
    total - Invoice.execute(sql_command).first[0]
  end

  def delete    
    sql_command = [
        %Q^
            CALL delete_invoice(:invoice_id);
        ^, {:invoice_id => id}
    ]
    Invoice.execute(sql_command)    
  end

  private     
  def self.sanitize_sql_array(array)
    ActiveRecord::Base.send(:sanitize_sql_array, array)
  end

  def self.execute(sql_command)
    ActiveRecord::Base.connection.execute( sanitize_sql_array(sql_command) )
  end
end
