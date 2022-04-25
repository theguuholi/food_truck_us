defmodule FoodTruckUs.FoodTrucks.FoodTruck do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:id, :applicant, :latitude, :longitude]}
  @fields ~w/address applicant location_description cnn facility_type food_items latitude longitude status/a
  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "food_truck" do
    field :address, :string
    field :applicant, :string
    field :cnn, :string
    field :facility_type, :string
    field :food_items, :string
    field :latitude, :float
    field :location_description, :string
    field :longitude, :float
    field :status, :string

    timestamps()
  end

  @doc false
  def changeset(food_truck, attrs) do
    food_truck
    |> cast(attrs, @fields)
    |> validate_required(@fields)
  end
end
