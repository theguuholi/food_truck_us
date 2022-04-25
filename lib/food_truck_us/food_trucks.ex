defmodule FoodTruckUs.FoodTrucks do
  import Ecto.Query, warn: false
  alias FoodTruckUs.FoodTrucks.FoodTruck
  alias FoodTruckUs.Repo
  alias Phoenix.PubSub

  def all(filters) when is_list(filters) do
    query = from(p in FoodTruck)

    filters
    |> Enum.reduce(query, fn
      {:paginate, %{page: page, per_page: per_page}}, query ->
        from q in query, offset: ^((page - 1) * per_page), limit: ^per_page
    end)
    |> Repo.all()
  end

  def find_food_truck(food_trucks, id) do
    Enum.find(food_trucks, &(&1.id == id))
  end

  def create(food_truct) do
    %FoodTruck{}
    |> FoodTruck.changeset(food_truct)
    |> Repo.insert()
    |> broadcast()
  end

  defp broadcast({:ok, food_truck}) do
    PubSub.broadcast(FoodTruckUs.PubSub, "new_food_truck", {:new_food_truck, food_truck})
    {:ok, food_truck}
  end

  defp broadcast({:error, _changeset} = error), do: error

  def subscribe, do: PubSub.subscribe(FoodTruckUs.PubSub, "new_food_truck")
end
