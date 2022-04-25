import FoodTruckLeaflet from "./foodTruckMap/foodTruckLeaflet";

const FoodTruckMap = {
    mounted() {
        this.map = new FoodTruckLeaflet(this.el, [39.74, -104.99], event = {

        })
        const foodTrucks = JSON.parse(this.el.dataset.foodTrucks);
        foodTrucks.forEach(foodTruck => {
            this.map.addMarker(foodTruck);
        })
    }
}

export default FoodTruckMap;