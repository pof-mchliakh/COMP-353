-- --------------------------------------------------------------------------------
-- Routine DDL
-- Note: comments before and after the routine body will not be stored by the server
-- --------------------------------------------------------------------------------
DELIMITER $$

CREATE PROCEDURE `rentrack_development`.`delete_reservation`
(IN reservation_id INT)
BEGIN

    #
    DELETE payment 
    FROM 
    payment INNER JOIN invoice ON
    payment.invoice_id = invoice.id
    WHERE invoice.reservation_id = reservation_id

    #Once the invoice details are deleted, we delete the invoice
    DELETE FROM invoice
    WHERE invoice.reservation_id = reservation_id

    #Delete from the reservation table
    DELETE FROM reservation
    WHERE reservation.id = reservation_id
END
