-- --------------------------------------------------------------------------------
-- Routine DDL
-- Note: comments before and after the routine body will not be stored by the server
-- --------------------------------------------------------------------------------
DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `rentrack_development`.`delete_reservation`(IN reservation_id INT)
BEGIN
    #Delete the mission
    DELETE FROM mission
    WHERE mission.reservation_id = reservation_id;

    #Delete the mission sheet
    DELETE mission_sheet
    FROM 
    mission INNER JOIN mission_sheet ON
    mission.id = mission_sheet.mission_id
    WHERE mission.reservation_id = reservation_id;

    #Delete the payment associated
    DELETE payment 
    FROM 
    payment INNER JOIN invoice ON
    payment.invoice_id = invoice.id
    WHERE invoice.reservation_id = reservation_id;

    DELETE invoice_tax
    FROM 
    invoice_tax INNER JOIN
    invoice ON invoice_tax.invoice_id = invoice.id
    WHERE invoice.reservation_id = reservation_id;

    #Once the invoice details are deleted, we delete the invoice
    DELETE FROM invoice
    WHERE invoice.reservation_id = reservation_id;

    #Delete from the reservation table
    DELETE FROM reservation
    WHERE reservation.id = reservation_id;
END