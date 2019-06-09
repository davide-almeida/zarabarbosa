$(document).ready(function() {
    (function() {
      //tooltip start
      $('[data-toggle="tooltip"]').tooltip({
          placement : 'top'
      });
      //tooltip end

      // sort categories courses

      // sort categories courses - FIM

      var showChar = 180;
      var ellipsestext = "...";
  
      $(".truncate").each(function() {
        var content = $(this).html();
        if (content.length > showChar) {
          var c = content.substr(0, showChar);
          var h = content;
          var html =
            '<div class="truncate-text" style="display:block">' +
            c +
            '<span class="moreellipses">' +
            ellipsestext +
            '&nbsp;&nbsp;<a href="" class="moreless more readMore"> ...Continuar Lendo</a></span></span></div><div class="truncate-text" style="display:none">' +
            h +
            '<a href="" class="moreless less readMore">...Esconder</a></span></div>';
  
          $(this).html(html);
        }
      });
  
      $(".moreless").click(function() {
        var thisEl = $(this);
        var cT = thisEl.closest(".truncate-text");
        var tX = ".truncate-text";
  
        if (thisEl.hasClass("less")) {
          cT.prev(tX).toggle();
          cT.slideToggle();
        } else {
          cT.toggle();
          cT.next(tX).fadeToggle();
        }
        return false;
      });
      /* end iffe */
    })();
  
    /* end ready */
  });


  
