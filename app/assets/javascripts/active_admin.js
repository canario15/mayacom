//= require active_admin/base
//= require chosen.jquery.min


$(document).on('ready page:load', function() {
   $("#accessory_phone_ids").chosen({
      no_results_text: "no hay resultados",
      placeholder_text_multiple: "Selecione los teléfonos compatibles"
   });
  $("#offer_phone_id").chosen({
      width: "20%",
      allow_single_deselect: true,
      no_results_text: "no hay resultados",
      placeholder_text_single: "Selecione un teléfono"
   });
  $("#offer_accessory_id").chosen({
      width: "20%",
      no_results_text: "no hay resultados",
      placeholder_text_single: "Selecione un accesorio"
   });



});
