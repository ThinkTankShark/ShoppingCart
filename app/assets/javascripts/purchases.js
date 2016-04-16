// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function() {
  $('#add-to-cart-form').on('ajax:success',function(event, response) {
      $("#cart-num").show();
      $("#cart-num").text(response);
  });
});
