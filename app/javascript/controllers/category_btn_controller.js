import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="affects"
export default class extends Controller {
  connect() {
    console.log('Controller connected');
  }

  handleIncidentSelection(event) {
    console.log('Incident selected');
    const selectedType = event.target.textContent;
    this.element.querySelector('button').textContent = selectedType;
  }
}
