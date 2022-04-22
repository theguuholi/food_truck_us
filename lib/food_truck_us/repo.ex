defmodule FoodTruckUs.Repo do
  use Ecto.Repo,
    otp_app: :food_truck_us,
    adapter: Ecto.Adapters.Postgres
end
