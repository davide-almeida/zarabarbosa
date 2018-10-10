//= require bootstrap_sb_admin_base_v2
//= require bootbox
//= require jquery-ui/widgets/datepicker
//= require jquery-ui/i18n/datepicker-pt-BR

/* Bootbox - Sobrescreve o data-confirm do Rails */
$.rails.allowAction = function(element) {
    var message = element.attr('data-confirm');
    if (!message) { return true; }
  
    var opts = {
      title: "Confirmação",
      message: message,
      buttons: {
          confirm: {
              label: 'Sim',
              className: 'btn-success'
          },
          cancel: {
              label: 'Não',
              className: 'btn-danger'
          }
      },
      callback: function(result) {
        if (result) {
          element.removeAttr('data-confirm');
          element.trigger('click.rails')
        }
      }
    };
  
    bootbox.confirm(opts);
  
    return false;
  }

/* Campo de data */
$( function() {
  $( "#datepicker1" ).datepicker();
  $( "#datepicker2" ).datepicker();
  $( "#datepicker3" ).datepicker();
} );

var corCompleta = "#99ff8f"
var corIncompleta = "#eff70b"

function ResetCampos(){
  var textFields = document.getElementsByTagName("input");
      for(var i=0; i < textFields.length; i++){
      if(textFields[i].type == "text"){
          textFields[i].style.backgroundColor = "";
          textFields[i].style.borderColor = "";
      }
  }
}