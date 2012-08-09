# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# -----------------------------------------------------------
# LOOKUP TABLES 
# -----------------------------------------------------------

Address.create([
    { street_name: "CHAMPLAIN BLVD", city: "Montreal", postal_code: "H4H1A1" },
    { street_name: "RENE LEVESQUE BLVD", city: "Montreal", postal_code: "H3B3B0" },
    { street_name: "PRINCE ARTHUR STREET", city: "Montreal", postal_code: "H2X1T4" },
    { street_name: "BERRI STREET", city: "Montreal", postal_code: "H2Y3E6" },
])


PaymentType.create([
     {name: "Check"},
     {name: "Credit Card"},
     {name: "Money"}, 
])

LicenseType.create([
    { name: "12W"},
    { name: "18W"},    
])

TruckType.create([
    {name: "12 Wheelers"}, 
    {name: "18 Wheelers"}
])

Truck.create([
    {truck_type_id: 1}, 
    {truck_type_id: 2}
])

TaxType.create([
    { name: "TPS" },
    { name: "TVQ" }
])

Tax.create([
    { start_date: Date.parse("2012-1-1 12:00:00"), end_date: Date.parse("2099-1-1 12:00:00"), percentage: 0.085, tax_type_id: 1 },
    { start_date: Date.parse("2012-1-1 12:00:00"), end_date: Date.parse("2099-1-1 12:00:00"), percentage: 0.075, tax_type_id: 2 }
])


CostType.create([
     {name: "KM"}, 
     {name: "Duration"}
 ])

Cost.create([
     {truck_type_id: 1, cost_type_id: 1, amt: 1.5},
     {truck_type_id: 1, cost_type_id: 2, amt: 2.0},
     {truck_type_id: 2, cost_type_id: 1, amt: 2.0},
     {truck_type_id: 2, cost_type_id: 2, amt: 4.0}
])

# -----------------------------------------------------------
# DATA TABLES 
# -----------------------------------------------------------

Person.create([
    {first_name: "Stan", last_name: "Marsh",      telephone: "5145550001", street_number: 1, address_id: 1},
    {first_name: "Eric", last_name: "Cartman",    telephone: "5145550002", street_number: 2, address_id: 2},
    {first_name: "Kyle", last_name: "Broflovski", telephone: "5145550003", street_number: 3, address_id: 3},
    {first_name: "Kenny", last_name: "McCornick", telephone: "5145550004", street_number: 4, address_id: 4},
    {first_name: "Bugs", last_name: "Bunny", telephone: "5145550005", street_number: 5, address_id: 4},
    {first_name: "Daffy", last_name: "Duck", telephone: "5145550006", street_number: 6, address_id: 2},
])

Client.create([
    { person_id: 1 },
    { person_id: 2 },
    { person_id: 3 },
    { person_id: 4 }
])

Reservation.create ([
    { address_id: 1, client_id: 1, street_number: 1234, appointment_date: Date.today, expected_end_time: Date.today }
])

Driver.create([
    { person_id: 5, license_type_id: 1 },
    { person_id: 6, license_type_id: 2 }
])

Mission.create([
    { truck_id: 1, driver_id: 1, reservation_id: 1, expected_start_time: Date.today, expected_end_time: Date.today }
])

MissionSheet.create([
    { mission_id: 1, actual_start_time: Date.today - 30 , actual_end_time: Date.today, start_odometer: 5000, end_odometer: 10000 }
])

Invoice.create([
    { date: Date.today, reservation_id: 1 }
])

