defmodule FoodTruckUs.ConvertCsvToMapTest do
  use FoodTruckUs.DataCase
  alias FoodTruckUs.ConvertCsvToMap

  @expected %{
    address: "3750 18TH ST",
    applicant: "The Geez Freeze",
    approved: "01/28/2022 12:00:00 AM",
    block: "3579",
    blocklot: "3579006",
    cnn: "887000",
    dayshours: "",
    expiration_date: "11/15/2022 12:00:00 AM",
    facility_type: "Truck",
    fire_prevention_districts: "8",
    food_items: "Snow Cones: Soft Serve Ice Cream & Frozen Virgin Daiquiris",
    latitude: 37.76201920035647,
    location: "(37.76201920035647, -122.42730642251331)",
    location_description: "18TH ST: DOLORES ST to CHURCH ST (3700 - 3799)",
    locationid: "1571753",
    longitude: -122.42730642251331,
    neighborhoods: "3",
    noi_sent: "",
    permit: "21MFF-00015",
    police_districts: "4",
    prior_permit: "0",
    received: "20210315",
    schedule:
      "http://bsm.sfdpw.org/PermitsTracker/reports/report.aspx?title=schedule&report=rptSchedule&params=permit=21MFF-00015&ExportPDF=1&Filename=21MFF-00015_schedule.pdf",
    status: "APPROVED",
    supervisor_districts: "5",
    x: "6004575.869",
    y: "2105666.974",
    zip_codes: "28862"
  }

  test "convert csv to map" do
    path = "Mobile_Food_Facility_Permit.csv"
    assert path |> ConvertCsvToMap.execute() |> hd == @expected
  end
end
