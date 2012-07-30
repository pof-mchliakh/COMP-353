for object in Address Client Cost CostType Driver DriverLicenseType LicenseType Invoice InvoiceTax Mission MissionSheet Payment Person Reservation Tax TaxType Truck TruckType
do
  rails d scaffold $object
done

for object in Addresses InvoiceTaxes People Taxes
do
  rails d bootstrap:themed $object
done

for object in Client Cost CostType Driver DriverLicenseType LicenseType Invoice Mission MissionSheet Payment PaymentType Reservation TaxTypes Truck TruckType
do
  rails d bootstrap:themed $object"s"
done

yes | rails g scaffold Address street_name:string city:string postal_code:string --skip-migration
yes | rails g scaffold Client name:string --skip-migration
yes | rails g scaffold Cost truck_type_id:int cost_type_id:int amt:decimal --skip-migration
yes | rails g scaffold CostType name:string --skip-migration
yes | rails g scaffold Driver person_id:int --skip-migration
yes | rails g scaffold DriverLicenseType driver_id:int license_type_id:int --skip-migration
yes | rails g scaffold LicenseType name:string --skip-migration
yes | rails g scaffold Invoice date:date --skip-migration
yes | rails g scaffold InvoiceTax invoice_id:int tax_id:int --skip-migration
yes | rails g scaffold MissionSheet actual_start_time:datetime actual_end_time:datetime start_odometer:int end_odometer:int mission_id:int --skip-migration
yes | rails g scaffold Payment invoice_id:int payment_type_id:int --skip-migration
yes | rails g scaffold PaymentType name:string --skip-migration
yes | rails g scaffold Person first_name:string last_name:string telephone:string street_number:int apt:string address_id:int --skip-migration
yes | rails g scaffold Reservation client_id:int mission_id:int address_id:int street_number:int apt:string appointment_date:datetime expected_end_time:datetime --skip-migration
yes | rails g scaffold TaxType name:string --skip-migration
yes | rails g scaffold Truck truck_type_id:int --skip-migration
yes | rails g scaffold TruckType name:string --skip-migration
yes | rails g scaffold Mission invoice_id:int driver_id:int truck_id:int expected_start_time:datetime expected_end_time:datetime --skip-migration
yes | rails g scaffold Tax start_date:datetime end_date:datetime percentage:float tax_type_id:int --skip-migration

for object in Addresses InvoiceTaxes People Taxes 
do
  yes | rails g bootstrap:themed $object
done

for object in Client Cost CostType Driver DriverLicenseType LicenseType Invoice Mission MissionSheet Payment PaymentType Reservation TaxTypes Truck TruckType
do
  yes | rails g bootstrap:themed $object"s"
done