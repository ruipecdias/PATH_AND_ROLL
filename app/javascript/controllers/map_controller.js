import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'

export default class extends Controller {
  static values = { apiKey: String, markers: Array }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue;

    this.map = new mapboxgl.Map({
      container: this.element,
      style: 'mapbox://styles/sixiao01/clpii274n00mn01pjd1wld7f1',
    });

    this.#addMarkersToMap();
    this.#fitMapToMarkers();
    this.getUserLocation();

  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const customMarker = document.createElement("div")
      customMarker.innerHTML = marker.marker_html

      // Pass the element as an argument to the new marker
      new mapboxgl.Marker(customMarker)
        .setLngLat([marker.lng, marker.lat])
        .addTo(this.map)
    });
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds();
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  }

  #recentermap() {
    const bounds = new mapboxgl.LngLatBounds();
    bounds.extend([ 38.7117262, -9.126715 ]); //38.7117262,-9.126715
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  }

  getUserLocation() {
    if ("geolocation" in navigator) {
      navigator.geolocation.getCurrentPosition(position => {
        const userLat = position.coords.latitude;
        const userLng = position.coords.longitude;
        this.centerMapOnLocation(userLat, userLng);
  
        // Create a marker for the user's location
        const userLocationMarker = new mapboxgl.Marker()
          .setLngLat([userLng, userLat])
          .addTo(this.map);
      }, error => {
        console.error("Error in getting location: ", error);
        // Handle error or default location here
      });
    } else {
      console.log("Geolocation is not supported by this browser.");
      // Handle browsers that don't support Geolocation
    }
  }
  
  centerMapOnLocation(lat, lng) {
    this.map.flyTo({
      center: [lng, lat],
      zoom: 15 // Adjust the zoom level as needed
    });
  }
}

