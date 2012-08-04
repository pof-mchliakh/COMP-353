# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# CostType.create([
#     {name: "KM"}, 
#     {name: "Duration"}
# ])

# -----------------------------------------------------------
# LOOKUP TABLES 
# -----------------------------------------------------------

Address.create([
    { street_name: "CHAMPLAIN BLVD", city: "Montreal", postal_code: "H4H 1A1" },
    { street_name: "RENE LEVESQUE BLVD", city: "Montreal", postal_code: "H3B 3B0" },
    { street_name: "PRINCE ARTHUR STREET", city: "Montreal", postal_code: "H2X 1T4" },
    { street_name: "BERRI STREET", city: "Montreal", postal_code: "H2Y 3E6" },
])


PaymentType.create([
     {name: "Check"},
     {name: "Credit Card"},
     {name: "Money"}, 
])

LicenseType.create([
    { name: "12W"},
    { name: "18W"},
    { name: "12345"}
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
    { start_date: Date.parse("2012-1-1 12:00:00"), end_date: Date.today, percentage: 0.085, tax_type_id: 1 },
    { start_date: Date.parse("2012-1-1 12:00:00"), end_date: Date.today, percentage: 0.075, tax_type_id: 2 }
])

# -----------------------------------------------------------
# DATA TABLES 
# -----------------------------------------------------------

Person.create([
    {first_name: "Stan", last_name: "Marsh",      telephone: "5145550001", street_number: 1, address_id: 1},
    {first_name: "Eric", last_name: "Cartman",    telephone: "5145550002", street_number: 2, address_id: 1},
    {first_name: "Kyle", last_name: "Broflovski", telephone: "5145550003", street_number: 3, address_id: 1},
    {first_name: "Kenny", last_name: "McCornick", telephone: "5145550004", street_number: 4, address_id: 1}
])

Client.create([
    { person_id: 1 }
])

Reservation.create ([
    { address_id: 1, client_id: 1, street_number: 1234, appointment_date: Date.today, expected_end_time: Date.today }
])

Driver.create([
    { person_id: 1 }
])

Mission.create([
    { truck_id: 1, driver_id: 1, reservation_id: 1, expected_start_time: Date.today, expected_end_time: Date.today }
])

Invoice.create([
    { date: Date.today, reservation_id: 1 }
])

Payment.create([
     {invoice_id: 1, payment_type_id: 1},
])

InvoiceTax.create([
    { invoice_id: 1, tax_id: 1}
])

# Invoice.create([ {date: Date.parse("2012-7-28 12:00:00")} ])

