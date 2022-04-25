defmodule FoodTruckUs.Repo.Migrations.CreateFoodTruck do
  use Ecto.Migration

  def change do
    create table(:food_truck, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :address, :string
      add :applicant, :string
      add :location_description, :string
      add :cnn, :string
      add :facility_type, :string
      add :food_items, :text
      add :latitude, :float
      add :longitude, :float
      add :status, :string

      timestamps()
    end
  end
end
