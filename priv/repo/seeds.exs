alias FoodTruckUs.ConvertCsvToMap
alias FoodTruckUs.FoodTruck
alias FoodTruckUs.Repo

"Mobile_Food_Facility_Permit.csv"
|> ConvertCsvToMap.execute()
|> Enum.each(fn food_truct ->
  %FoodTruck{}
  |> FoodTruck.changeset(food_truct)
  |> Repo.insert()
end)
