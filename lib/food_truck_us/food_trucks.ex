defmodule FoodTruckUs.FoodTrucks do
  import Ecto.Query, warn: false
  alias FoodTruckUs.FoodTrucks.FoodTruck
  alias FoodTruckUs.Repo

  def all(filters) when is_list(filters) do
    query = from(p in FoodTruck)

    filters
    |> Enum.reduce(query, fn
      {:paginate, %{page: page, per_page: per_page}}, query ->
        from q in query, offset: ^((page - 1) * per_page), limit: ^per_page
    end)
    |> Repo.all()
  end

  def create(food_truct) do
    %FoodTruck{}
    |> FoodTruck.changeset(food_truct)
    |> Repo.insert()
  end
end
