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

# PaymentType.create([
#      {name: "Check"},
#      {name: "Credit Card"},
#      {name: "Money"}, 
#      {name: "Sexual Favour"}
# ])

# TruckType.create([
#     {name: "12 Wheelers"}, 
#     {name: "18 Wheelers"}
# ])

# Truck.create([
#     {truck_type_id: 1}, 
#     {truck_type_id: 2}
# ])

Address.create([
    { street_name: "CHAMPLAIN BLVD", city: "Montreal", postal_code: "H4H 1A1" },
    { street_name: "RENE LEVESQUE BLVD", city: "Montreal", postal_code: "H3B 3B0" },
    { street_name: "PRINCE ARTHUR STREET", city: "Montreal", postal_code: "H2X 1T4" },
    { street_name: "BERRI STREET", city: "Montreal", postal_code: "H2Y 3E6" },
])

# Person.create([
#     {first_name: "Stan", last_name: "Marsh",      telephone: "5145550001", address_id: 1},
#     {first_name: "Eric", last_name: "Cartman",    telephone: "5145550002", address_id: 1},
#     {first_name: "Kyle", last_name: "Broflovski", telephone: "5145550003", address_id: 1},
#     {first_name: "Kenny", last_name: "McCornick", telephone: "5145550004", address_id: 1}
# ])

# TaxType.create([
#     { name: "TPS" },
#     { name: "TVQ" }
# ])

# Tax.create([
#     { start_date: Date.parse("2012-1-1 12:00:00"), end_date: nil, percentage: 0.085, tax_type_id: 1 },
#     { start_date: Date.parse("2012-1-1 12:00:00"), end_date: nil, percentage: 0.075, tax_type_id: 2 }
# ])

# Invoice.create([ {date: Date.parse("2012-7-28 12:00:00")} ])

# LicenseType.create([
#     { name: "12W"},
#     { name: "18W"},
#     { name: "12345"}
# ])