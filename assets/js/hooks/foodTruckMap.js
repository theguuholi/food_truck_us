import FoodTruckLeaflet from "./foodTruckMap/foodTruckLeaflet";

const FoodTruckMap = {
    mounted() {
        selectPoint = JSON.parse(this.el.dataset.selectPoint)
        this.map = new FoodTruckLeaflet(this.el, [selectPoint.latitude, selectPoint.longitude], event = {

        })
        const foodTrucks = JSON.parse(this.el.dataset.foodTrucks);
        foodTrucks.forEach(foodTruck => {
            this.map.addMarker(foodTruck);
        })

        this.handleEvent("highlight-marker", e => {
            this.map.highlightMarker(e)
        })
    }
}

export default FoodTruckMap;