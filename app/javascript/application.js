// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"

import "controllers/hide_logo"


document.addEventListener('turbolinks:load', function() {
    const toggleForm = document.querySelector('[data-form="toggle-pin"]');
    
    toggleForm.addEventListener('ajax:success', function(event) {
      // Logic to update the page based on the response
      // For example, change the toggle button text and style
    });
  
    toggleForm.addEventListener('ajax:error', function(event) {
      // Handle any errors
      alert('Error processing request');
    });
  });