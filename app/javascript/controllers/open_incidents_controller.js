import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="open-incidents"
export default class extends Controller {
  connect() {

    const queryString = window.location.search;
    const urlParams = new URLSearchParams(queryString);
    const incidentId = urlParams.get('last_incident_id')
    const lastIncidentCanvas = document.getElementById(`button-${incidentId}`);
    if (lastIncidentCanvas) {
      lastIncidentCanvas.click();
    }

  }
}
