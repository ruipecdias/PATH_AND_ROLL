import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="address-input"
export default class extends Controller {
  connect() {
    console.log('oi');
    console.log('address', this.addressInputValue);
    const jorge = document.getElementById('user-location');
  }
}


