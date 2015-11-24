// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

// displayForm = function() {
//   $('#location-filter').on('change', function() {
//   //   switch($('input:radio[name=payment_type]:checked').val()) {
//   //     case 'stripe':
//   //       hideForm();
//   //       $('.new_stripe').toggle();
//   //       break;
//   //     case 'check':
//   //       hideForm();
//   //       $('.new_check').toggle();
//   //       break;
//   //     case 'loan':
//   //       hideForm();
//   //       $('.new_loan').toggle();
//   //       break;
//   //     case 'wire':
//   //       hideForm();
//   //       $('.new_wire').toggle();
//   //       break;
//   //   }
//   console.log("You made it");
//   });
// }
//
// $(document).ready(displayForm);
// $(document).on('page:load', displayForm);

// Something to try...
$(document).ready( function() {
  $('#location-filter').on('change',function(){ // use event as per your need
    console.log("about to ajax");
    $.ajax("location");
  });
});
