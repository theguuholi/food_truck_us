defmodule FoodTruckUsWeb.MapLive do
  use FoodTruckUsWeb, :live_view
  alias FoodTruckUs.FoodTrucks

  def mount(_params, _session, socket) do
    food_trucks = FoodTrucks.all([])
    socket = assign(socket, food_trucks: food_trucks, selected_food_truck: nil)
    {:ok, socket}
  end

  def handle_event("select_food_truck", %{"id" => id}, socket) do
    socket =
      socket.assigns.food_trucks
      |> FoodTrucks.find_food_truck(id)
      |> then(&assign(socket, selected_food_truck: &1))

    {:noreply, socket}
  end
end
