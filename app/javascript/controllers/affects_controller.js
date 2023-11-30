import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="affects"
export default class extends Controller {
  connect() {

  }

  change() {
    console.log("click no button")
  }
}


// document.addEventListener('DOMContentLoaded', function () {
//   const shareButton = document.getElementById('shareButton');
//   const optionsContainer = document.getElementById('optionsContainer');
//   const copyLinkButton = document.getElementById('copyLinkButton');

//   shareButton.addEventListener('click', function () {
//     optionsContainer.classList.toggle('show-options');
//   });

//   copyLinkButton.addEventListener('click', function () {
//     const incidentUrl = '<%= incident_url(incident) %>';
//     const tempInput = document.createElement('input');
//     document.body.appendChild(tempInput);
//     tempInput.value = incidentUrl;
//     tempInput.select();
//     document.execCommand('copy');
//     document.body.removeChild(tempInput);
//     alert('Link copied to clipboard!');
//   });
// });

// /*The code below is for the it affects me btn*/
// let isBtnToggled = false;

// function toggleText() {
//   const button = document.getElementById('toggleButton');

//   if (isBtnToggled) {
//     button.innerText = 'It affects me!';
//   } else {
//     button.innerText = 'It doens\'t affect me';
//   }

//   isBtnToggled = !isBtnToggled;
