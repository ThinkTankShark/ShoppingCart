// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function() {
  $('.add-to-cart').on('ajax:success', function(event, response) {
    $('.shopping-cart:last').remove();
    $( '#category-title' ).prepend(response);
  });

  $( '.remove_item' ).on('ajax:success', function(event, response) {
    var id = response.id;
    var qty = response.qty;
    $( 'tr#' + id + ' td:nth-child(2)').text(qty);
  });

});
