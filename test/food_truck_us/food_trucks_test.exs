defmodule FoodTruckUs.FoodTrucksTest do
  use FoodTruckUs.DataCase
  alias FoodTruckUs.FoodTrucks

  test "should list all food trucks" do
    pagination = [paginate: %{page: 1, per_page: 5}]
    assert FoodTrucks.all(pagination)
  end

  test "create a food_truck" do
    payload = %{
      address: "3750 18TH ST",
      applicant: "The Geez Freeze",
      cnn: "887000",
      facility_type: "Truck",
      location_description: "18TH ST: DOLORES ST to CHURCH ST (3700 - 3799)",
      food_items: "Snow Cones: Soft Serve Ice Cream & Frozen Virgin Daiquiris",
      latitude: 37.76201920035647,
      longitude: -122.42730642251331,
      status: "APPROVED"
    }

    assert {:ok, food_truck} = FoodTrucks.create(payload)

    assert payload.applicant == food_truck.applicant
  end
end
