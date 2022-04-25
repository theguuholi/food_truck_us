alias FoodTruckUs.ConvertCsvToMap
alias FoodTruckUs.FoodTrucks

"Mobile_Food_Facility_Permit.csv"
|> ConvertCsvToMap.execute()
|> Enum.each(&FoodTrucks.create/1)
