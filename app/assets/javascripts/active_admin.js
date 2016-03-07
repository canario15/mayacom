//= require active_admin/base
//= require chosen.jquery.min


$(document).ready(function() {
   $("#accessory_phone_ids").chosen({
      no_results_text: "no hay resultados",
      placeholder_text_multiple: "Selecione los teléfonos compatibles"
   });

});
