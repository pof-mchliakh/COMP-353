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


-- --------------------------------------------------------------------------------
-- Routine DDL
-- Note: comments before and after the routine body will not be stored by the server
-- --------------------------------------------------------------------------------
DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `select_invoice_info`(IN passed_client_id INT, IN start_date DATETIME, IN end_date DATETIME)
BEGIN
    SELECT actual_start_time, actual_end_time, start_odometer, end_odometer
    FROM mission_sheet

    INNER JOIN mission
    ON mission_sheet.mission_id = mission.id

    INNER JOIN reservation
    ON mission.reservation_id = reservation.id
    AND reservation.id = passed_client_id

    INNER JOIN invoice
    ON reservation.id = invoice.reservation_id

    WHERE (invoice.date < end_date) AND (invoice.date > start_date);
END

delimiter $$

CREATE DEFINER=`root`@`localhost` FUNCTION `reservation_total_cost_no_tax`(reservation_id INT) RETURNS decimal(10,2)
BEGIN
    DECLARE total DECIMAL(10, 2);

    CREATE TEMPORARY TABLE details (
        mission_id INT,
        truck_type_id INT,
        km  INT,
        duration INT
    );

    -- Wouldn't be needed usually by mysql is shit and doesn't allow reusing a temp table in the same query
    CREATE TEMPORARY TABLE results (
        unit INT,
        price DECIMAL(10, 2)
    );

    INSERT INTO details
    SELECT
        mission.id,
        truck.truck_type_id,
        end_odometer - start_odometer,
        DATEDIFF(actual_end_time, actual_start_time)
    FROM
        reservation INNER JOIN
        mission       ON reservation.id   = mission.reservation_id   INNER JOIN
        mission_sheet ON mission.id       = mission_sheet.mission_id INNER JOIN
        truck         ON mission.truck_id = truck.id
    WHERE reservation.id = reservation_id;

    INSERT INTO results
    SELECT 
        details.km,
        cost.amt
    FROM
        details INNER JOIN
        cost        ON  details.truck_type_id = cost.truck_type_id INNER JOIN
        cost_type   ON  cost.cost_type_id     = cost_type.id
                    AND cost_type.name        = 'KM';

    INSERT INTO results
    SELECT 
        details.duration,
        cost.amt
    FROM
        details INNER JOIN
        cost        ON  details.truck_type_id = cost.truck_type_id INNER JOIN
        cost_type   ON  cost.cost_type_id     = cost_type.id
                    AND cost_type.name        = 'Duration';

    
    SELECT SUM(unit * price)
    INTO total
    FROM results;

    DROP TEMPORARY TABLE details;
    DROP TEMPORARY TABLE results;
    RETURN total;            
END$$

delimiter $$

CREATE DEFINER=`root`@`localhost` FUNCTION `reservation_total_cost_paid`(reservation_id INT) RETURNS decimal(10,2)
BEGIN
    DECLARE total DECIMAL(10, 2);

    SELECT
        SUM(amount)
    INTO total
    FROM
        reservation INNER JOIN
        invoice ON reservation.id = invoice.reservation_id INNER JOIN
        payment ON invoice.id     = payment.invoice_id
     WHERE reservation.id = reservation_id;
    
    RETURN total;            
END$$

delimiter $$

CREATE DEFINER=`root`@`localhost` FUNCTION `select_tax`(date DATETIME, tax_type_name VARCHAR(50)) RETURNS decimal(10,2)
BEGIN
    RETURN (
        SELECT
            percentage
        FROM 
        tax INNER JOIN
        tax_type ON  tax.tax_type_id      = tax_type.id 
                 AND lower(tax_type.name) = lower(tax_type_name)
        WHERE tax.start_date <= date AND tax.end_date >= date       
    );            
END$$

delimiter $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_invoice`(invoice_id INT)
BEGIN
    DELETE FROM payment
    WHERE payment.invoice_id = invoice_id;

    DELETE FROM invoice
    WHERE invoice.id = invoice_id;    
END$$

