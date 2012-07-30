for object in Address Client Cost CostType Driver LicenceType Invoice InvoiceTax Mission MissionSheet Payment PaymentType Person Reservation Tax TaxType Truck TruckType
do
  rails d scaffold $object
done

for object in Addresses InvoiceTaxes People Taxes
do
  rails d bootstrap:themed $object
done

for object in Client Cost CostType Driver LicenceType Invoice Mission MissionSheet Payment PaymentType Reservation Tax Truck TruckType
do
  rails d bootstrap:themed $object"s"
done