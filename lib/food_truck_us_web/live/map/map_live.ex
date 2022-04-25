defmodule FoodTruckUsWeb.MapLive do
  use FoodTruckUsWeb, :live_view
  alias FoodTruckUs.FoodTrucks

  def mount(_params, _session, socket) do
    food_trucks = FoodTrucks.all([])
    socket = assign(socket, food_trucks: food_trucks, selected_food_truck: nil)
    {:ok, socket}
  end

  def handle_event("select_food_truck", %{"id" => id}, socket) do
    selected_food_truck = FoodTrucks.find_food_truck(socket.assigns.food_trucks, id)

    socket =
      socket
      |> assign(selected_food_truck: selected_food_truck)
      |> push_event("highlight-marker", selected_food_truck)

    {:noreply, socket}
  end
end
