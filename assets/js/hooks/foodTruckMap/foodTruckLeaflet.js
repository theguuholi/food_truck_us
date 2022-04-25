import L from "leaflet";

class FoodTruckLeaflet {
    constructor(element, center, markerClickedCallback) {
        this.map = L.map(element).setView(center, 13);

        const accessToken = "pk.eyJ1IjoiZ3V1aG9saSIsImEiOiJja2c5bTk2anEwMjd0MnJwbmlsaDlqdnBwIn0.5Hjtf-hQ0oNPoznzqUyGWQ";

        L.tileLayer(
            "https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token={accessToken}", {
                attribution: "Gustavo Oliveira",
                mapZoom: 40,
                id: "mapbox/streets-v11",
                tileSize: 512,
                zoomOffset: -1,
                accessToken: accessToken
            }
        ).addTo(this.map);

        this.markerClickedCallback = markerClickedCallback;
    }

    addMarker(foodTruck) {
        const marker = L.marker([foodTruck.latitude, foodTruck.longitude], {
                foodTruckId: foodTruck.id
            })
            .addTo(this.map)
            .bindPopup(foodTruck.applicant)

        marker.on("click", e => {
            marker.openPopup();
            this.markerClickedCallback(e)
        })

        return marker;
    }

    highlightMarker(foodTruck) {
        const marker = this.markerForFoodTruck(foodTruck);
        marker.openPopup()
        this.map.panTo(marker.getLatLng())
    }

    markerForFoodTruck(foodTruck) {
        let markerLayer;
        this.map.eachLayer(layer => {
            if (layer instanceof L.Marker) {
                const markerPosition = layer.getLatLng();
                if (markerPosition.lat === foodTruck.latitude && markerPosition.lng === foodTruck.longitude) {
                    markerLayer = layer;
                }
            }
        })
        return markerLayer;
    }

}

export default FoodTruckLeaflet;