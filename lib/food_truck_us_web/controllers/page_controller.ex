defmodule FoodTruckUsWeb.PageController do
  use FoodTruckUsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
