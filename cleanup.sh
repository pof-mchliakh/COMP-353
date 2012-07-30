for object in Address Client Cost CostType Driver Licence Invoice InvoiceTax Mission MissionSheet Payment Person Reservation Tax TaxType Truck TruckType
do
  rails d scaffold $object
done

for object in Addresses InvoiceTaxes People Taxes
do
  rails d bootstrap:themed $object
done

for object in Client Cost CostType Driver Licence Invoice Mission MissionSheet Payment Reservation Tax Truck TruckType
do
  rails d bootstrap:themed {$object}s
done