$(document).ready(function(){

  function fadeAlert(){
    $('.alert-temp').removeClass('in');
  }

  function removeAlert(){
    $('.alert-temp').remove();
  }

  window.setTimeout(fadeAlert,1000);
  window.setTimeout(removeAlert,3000);

});
