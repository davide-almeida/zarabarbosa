// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require tinymce
//= require rails-ujs
//= require bootstrap.growl
//= require nested_form_fields

jQuery(document).ready(function(jQuery) {   
             
    var topMenu = jQuery("#top-menu"),
        offset = 40,
        topMenuHeight = topMenu.outerHeight()+offset,
        // All list items
        menuItems =  topMenu.find('a[href*="#"]'),
        // Anchors corresponding to menu items
        scrollItems = menuItems.map(function(){
          var href = jQuery(this).attr("href"),
          id = href.substring(href.indexOf('#')),
          item = jQuery(id);
          //console.log(item)
          if (item.length) { return item; }
        });

    // so we can get a fancy scroll animation
    menuItems.click(function(e){
      var href = jQuery(this).attr("href"),
        id = href.substring(href.indexOf('#'));
          offsetTop = href === "#" ? 0 : jQuery(id).offset().top-topMenuHeight+1;
      jQuery('html, body').stop().animate({ 
          scrollTop: offsetTop
      }, 300);
      e.preventDefault();
    });

    // Bind to scroll
    jQuery(window).scroll(function(){
       // Get container scroll position
       var fromTop = jQuery(this).scrollTop()+topMenuHeight;

       // Get id of current scroll item
       var cur = scrollItems.map(function(){
         if (jQuery(this).offset().top < fromTop)
           return this;
       });

       // Get the id of the current element
       cur = cur[cur.length-1];
       var id = cur && cur.length ? cur[0].id : "";               
       
       menuItems.parent().removeClass("active");
       if(id){
            menuItems.parent().end().filter("[href*='#"+id+"']").parent().addClass("active");
       }
       
    })
})
