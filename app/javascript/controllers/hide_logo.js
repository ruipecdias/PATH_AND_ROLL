document.addEventListener('turbolinks:load', function () {
  var myOffcanvas = document.getElementById('offcanvasBottom');
  var logo = document.getElementById('biglogo');

  if (myOffcanvas && logo) {
    myOffcanvas.addEventListener('shown.bs.offcanvas', function () {
      console.log('Offcanvas is shown');
      logo.style.display = 'none';
    });

    myOffcanvas.addEventListener('hidden.bs.offcanvas', function () {
      console.log('Offcanvas is hidden');
      logo.style.display = 'block';
    });
  } else {
    console.error('Offcanvas or logo element not found.');
  }
});
