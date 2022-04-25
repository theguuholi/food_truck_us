defmodule FoodTruckUsWeb.MapLiveTest do
  use FoodTruckUsWeb.ConnCase
  import Phoenix.LiveViewTest
  alias FoodTruckUs.FoodTrucks

  @payload %{
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

  test "should load sidebar", %{conn: conn} do
    {:ok, food_truck} = FoodTrucks.create(@payload)
    {:ok, view, _html} = live(conn, "/")

    assert has_element?(
             view,
             "[data-role=food-truck][data-id=#{food_truck.id}]",
             food_truck.applicant
           )

    assert has_element?(view, "#wrapper")
    assert has_element?(view, "#map")
  end

  test "select a food truck", %{conn: conn} do
    {:ok, food_truck} = FoodTrucks.create(@payload)
    {:ok, view, _html} = live(conn, "/")
    view |> element("[data-role=food-truck][data-id=#{food_truck.id}]") |> render_click()
    assert view |> element("[data-role=food-truck][data-id=#{food_truck.id}]") |> render =~ "red"
  end

  test "simulate when click in a foodtruck", %{conn: conn} do
    {:ok, food_truck} = FoodTrucks.create(@payload)
    {:ok, view, _html} = live(conn, "/")

    view
    |> element("#map")
    |> render_hook("marker-clicked", %{id: food_truck.id})

    assert view |> element("[data-role=food-truck][data-id=#{food_truck.id}]") |> render =~ "red"
  end

  test "load all food trucks", %{conn: conn} do
    FoodTrucks.create(@payload)
    {:ok, view, _html} = live(conn, "/")

    view
    |> element("#map")
    |> render_hook("load-food-trucks", [])

    assert has_element?(view, "#map")
  end
end
