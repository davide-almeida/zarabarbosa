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

/* tests */
// $(document).ready(function(){
  // $(window).on('load', function() {
  
  //   console.log("O id #testee existe");
  //   $("select").change(function(){
  //       console.log("MUDOU!");
  //       $(this).find("option:selected").each(function(){
  //           var optionValue = $(this).attr("value");
  //           if(optionValue){
  //               $(".box").not("." + optionValue).hide();
  //               $("." + optionValue).show();
  //           } else{
  //               $(".box").hide();
  //           }
  //       });
  //   }).change();
    
  // });
// });

// two rules inputs
// document.addEventListener('DOMContentLoaded', () => {

  // $(function() {
  //   inputN = 0
  //   $('.add-rule').click(function() {
  //     inputN += 1;
  //     if (document.getElementById("inputid")) {
  //         document.getElementById("inputid").id = 'inputid' + inputN;
  //         console.log("Entrou na changediv()");
  //     }
  //     console.log(inputN);
  //     setInterval( function() {
  //       $('.selectTest_added').change(function(){
  //           $('.box').hide();
  //           $('.' + $(this).val()).show();
  //           // console.log("Change select!!");
  //       });
  //     }, 1);
  //   });
  // });

  // function changediv() {
  //   if (document.getElementById("inputid")) {
  //       // document.getElementById("inputid").innerHTML = Date();
  //       document.getElementById("inputid").id = 'inputid' + inputN;
  //       console.log("Entrou na changediv()");
  //   }
    // } else {
    //     document.getElementById("div_top2").innerHTML = "teste";            
    //     document.getElementById("div_top2").id = "inputid";
    // }
  // }

// });

// $(document).ready(function() { 

  // $('.add-rule').click(function() {
    // $('#testee').change(function(){
    //   setInterval( function() {
    //     $('.box').hide();
    //     $('#' + $(this).val()).show();
    //   });
    // console.log("Clicou");
    // }, 1);
  // });

// });

// $(document).ready(function() { 
//   $(window).on('load', function() {
//     if ($('#testee').length) {
//     }  else {
//       console.log("O id #testee não existe");
//     }
//   });
//  });
 

// DataTables
$(document).ready( function () {
  if ($("#datatable").length) {
    $('#datatable').DataTable({
      dom: 'Bfrtip',
      // dom: '<"top"i>rt<"bottom"flp><"clear">',
      // "dom": "<'row'<'col-md-6'l><'col-md-6'Bf>>" +
      //         "<'row'<'col-md-6'><'col-md-6'>>" +
      //         "<'row'<'col-md-12't>><'row'<'col-md-12'ip>>",
      responsive: true,
      // lengthMenu: [
      //     [ 10, 25, 50, -1 ],
      //     [ '10 registros', '25 registros', '50 registros', 'Exibir todos' ]
      // ],
      // buttons: ['copyHtml5','excelHtml5','csvHtml5','pdfHtml5']
      buttons: [
          [
            'pageLength'
          ],
          {
              extend: 'print',
              text: 'Imprimir',
              exportOptions: {
                  columns: [ 1, 2 ] //Definir quais colunas estarão visíveis para impressão
              }
          },
          {
            extend: 'copy',
            text: 'Copiar'
          },
          {
              extend: 'csv',
              text: 'Excel'
          },
      ],
      "pagingType": "simple_numbers",
      // "pagingType": "simple_numbers",
      // "dom": '<"topcustom"lfr>t<"bottomcustom"ip>',
      "language": {
          "url": "//cdn.datatables.net/plug-ins/1.10.16/i18n/Portuguese-Brasil.json",
          buttons: {
              pageLength: {
                  _: "Exibir %d registros"
              }
          }
      }
    });
  }
} );


// $(document).ready( function () {
//   if ($("#datatable2").length) {
//     $('#datatable2').DataTable({
//       dom: 'Blfrtip',
//       buttons: ['copyHtml5','excelHtml5','csvHtml5','pdfHtml5']
//     });
//   }
// } );

$(document).ready( function () {
  if ($("table.tabela_display_receita").length) {
    $('table.tabela_display_receita').DataTable({
      dom: 'Bfrtip',
      responsive: true,
      lengthMenu: [
          [ 10, 25, 50, -1 ],
          [ '10 registros', '25 registros', '50 registros', 'Exibir todos' ]
      ],
      buttons: [
          // {
          //     extend: 'csv',
          //     text: 'Exportar Excel'
          // },
          // {
          //     extend: 'copy',
          //     text: 'Copiar'
          // },
          {
              extend: 'print',
              text: 'Imprimir',
              exportOptions: {
                  columns: [ 0, 1, 2, 3, 4, 5, 6 ] //Definir quais colunas estarão visíveis para impressão
              }
          },
          // [
          //     'pageLength'
          // ]

      ],
      "language": {
          "url": "//cdn.datatables.net/plug-ins/1.10.16/i18n/Portuguese-Brasil.json",
          buttons: {
              pageLength: {
                  _: "Exibir %d registros"
              }
          }
      }

    });
  }
} );