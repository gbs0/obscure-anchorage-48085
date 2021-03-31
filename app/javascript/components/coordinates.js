const browserNavigator = () => {
  navigator.geolocation.getCurrentPosition(showPosition, showError);
  
  var lat = document.getElementById("lat");
  var lng = document.getElementById("lng");
  
  function showPosition(position) {
    lat.innerHTML = position.coords.latitude; 
    lng.innerHTML = position.coords.longitude;
    console.log(position.coords.latitude);
    console.log(position.coords.longitude);
  }

  function showError( error ) {
    console.log( 'getCurrentPosition returned error', error);
  }
}

export { browserNavigator };