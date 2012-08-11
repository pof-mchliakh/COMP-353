class ReportController < ApplicationController
	respond_to :html, :js

  def show
  	from_date = Date.new params[:from_date][:year].to_i,
  		params[:from_date][:month].to_i, params[:from_date][:day].to_i
		until_date = Date.new params[:until_date][:year].to_i,
  		params[:until_date][:month].to_i, params[:until_date][:day].to_i

  	@invoices = Invoice.find_by_sql ["
  		SELECT invoice.*
      FROM invoice INNER JOIN
      	reservation ON invoice.reservation_id = reservation.id
	    INNER JOIN
	    	client ON reservation.client_id = client.id
	    WHERE reservation.client_id = :client_id
	    AND invoice.date <= :until_date
	    AND invoice.date >= :from_date", {
    		client_id: params[:reservation][:client_id].to_i,
    		from_date: from_date,
    		until_date: until_date
    }]
    respond_with @invoices
  end

  def new
  	@clients = Person.find_by_sql %Q^
      SELECT DISTINCT person.*
      FROM person INNER JOIN
      	client ON person.id = client.person_id
	    INNER JOIN
	    	reservation ON client.id = reservation.client_id
	    INNER JOIN
	    	invoice ON reservation.id = invoice.reservation_id
    ^
    respond_with @clients
  end
end