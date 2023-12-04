document.addEventListener('DOMContentLoaded', function() {
  document.querySelectorAll('.marker').forEach(function(marker) {
    marker.addEventListener('click', function() {
      // Trigger the hideLogo method in the logo controller
      const logoController = application.getControllerForElementAndIdentifier(document.querySelector('.logo_overlay'), 'logo');
      if (logoController) {
        logoController.hideLogo();
      }
    });
  });
});
