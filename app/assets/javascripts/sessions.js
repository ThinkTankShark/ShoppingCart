// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function() {
  $('.add-to-cart').on('ajax:success', function(event, response) {
    $( '#category-title' ).prepend(response);

  })
});
