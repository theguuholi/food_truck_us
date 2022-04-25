import FoodTruckLeaflet from "./foodTruckMap/foodTruckLeaflet";

const FoodTruckMap = {
    mounted() {
        selectPoint = JSON.parse(this.el.dataset.selectPoint)
        this.map = new FoodTruckLeaflet(this.el, [selectPoint.latitude, selectPoint.longitude], event => {
            const foodTruckId = event.target.options.foodTruckId;
            this.pushEvent("marker-clicked", foodTruckId, (reply, ref) => {
                this.scrollTo(reply.food_truck.id);
            })
        })

        // const foodTrucks = JSON.parse(this.el.dataset.foodTrucks);
        // foodTrucks.forEach(foodTruck => {
        //     this.map.addMarker(foodTruck);
        // })
        this.pushEvent("load-food-trucks", {}, (reply, ref) => {
            reply.food_trucks.forEach(
                foodTruck => {
                    this.map.addMarker(foodTruck);
                });
        })

        this.handleEvent("highlight-marker", e => {
            this.map.highlightMarker(e)
        })

        this.handleEvent("add-marker", e => {
            this.map.addMarker(e);
            this.map.highlightMarker(e);
            this.scrollTo(e.id)
        })
    },
    scrollTo(foodTruckId) {
        const foodTruckElement = document.querySelector(`[phx-value-id="${foodTruckId}"]`);
        foodTruckElement.scrollIntoView(false);
    }
}

export default FoodTruckMap;