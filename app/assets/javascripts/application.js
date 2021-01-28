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
// require shuffle





// jQuery(document).ready(function(jQuery) {   
             
//     var topMenu = jQuery("#top-menu"),
//         offset = 40,
//         topMenuHeight = topMenu.outerHeight()+offset,
//         // All list items
//         menuItems =  topMenu.find('a[href*="#"]'),
//         // Anchors corresponding to menu items
//         scrollItems = menuItems.map(function(){
//           var href = jQuery(this).attr("href"),
//           id = href.substring(href.indexOf('#')),
//           item = jQuery(id);
//           //console.log(item)
//           if (item.length) { return item; }
//         });

//     // so we can get a fancy scroll animation
//     menuItems.click(function(e){
//       var href = jQuery(this).attr("href"),
//         id = href.substring(href.indexOf('#'));
//           offsetTop = href === "#" ? 0 : jQuery(id).offset().top-topMenuHeight+1;
//       jQuery('html, body').stop().animate({ 
//           scrollTop: offsetTop
//       }, 300);
//       e.preventDefault();
//     });

//     // Bind to scroll
//     jQuery(window).scroll(function(){
//        // Get container scroll position
//        var fromTop = jQuery(this).scrollTop()+topMenuHeight;

//        // Get id of current scroll item
//        var cur = scrollItems.map(function(){
//          if (jQuery(this).offset().top < fromTop)
//            return this;
//        });

//        // Get the id of the current element
//        cur = cur[cur.length-1];
//        var id = cur && cur.length ? cur[0].id : "";               
       
//        menuItems.parent().removeClass("active");
//        if(id){
//             menuItems.parent().end().filter("[href*='#"+id+"']").parent().addClass("active");
//        }
       
//     })
// })





/* radio buttons */
$(document).ready(function(){
	$(".check_class").click(function() {
		$(".check_class").prop("checked", true); //uncheck all checkboxes
		$(this).prop("checked", true);  //check the clicked one
	});

	$('input[type="checkbox"]').change( function() {
			
		if ($('#radio1').is(":checked")){
			
			$('.categoria1').collapse('show');
		
		} else {
			
			$('.categoria1').collapse('hide');
		}
		
		if ($('#radio2').is(":checked")){

			//$('#radio1').prop("checked", false);
			$('.categoria2').collapse('show');
		
		} else {
			
			$('.categoria2').collapse('hide');
		}
		
		if ($('#radio3').is(":checked")){

			$('.categoria3').collapse('show');
		
		} else {
			
			$('.categoria3').collapse('hide');
		}

	});
});

// $(document).ready(function() { 
//   $(window).on('load', function() {
//     if ($('.shuffle').length > 0) {
//       console.log("shuffle existe");
//     } else {
//       console.log("shuffle não existe");
//     }
//   });
// });


var Shuffle = window.Shuffle;

class Demo {
  constructor(element) {
    this.element = element;
    this.shuffle = new Shuffle(element, {
      itemSelector: '.picture-item',
      sizer: element.querySelector('.my-sizer-element'),
    });

    // Log events.
    this.addShuffleEventListeners();
    this._activeFilters = [];
    this.addFilterButtons();
    this.addSorting();
    this.addSearchFilter();
  }

  /**
   * Shuffle uses the CustomEvent constructor to dispatch events. You can listen
   * for them like you normally would (with jQuery for example).
   */
  addShuffleEventListeners() {
    this.shuffle.on(Shuffle.EventType.LAYOUT, (data) => {
      console.log('layout. data:', data);
    });
    this.shuffle.on(Shuffle.EventType.REMOVED, (data) => {
      console.log('removed. data:', data);
    });
  }

  addFilterButtons() {
    const options = document.querySelector('.filter-options');
    if (!options) {
      return;
    }
    
    const filterButtons = Array.from(options.children);
    const onClick = this._handleFilterClick.bind(this);
    filterButtons.forEach((button) => {
      button.addEventListener('click', onClick, false);
    });
  }

  _handleFilterClick(evt) {
    const btn = evt.currentTarget;
    const isActive = btn.classList.contains('active');
    const btnGroup = btn.getAttribute('data-group');
    
    this._removeActiveClassFromChildren(btn.parentNode);
    
    let filterGroup;
    if (isActive) {
      btn.classList.remove('active');
      filterGroup = Shuffle.ALL_ITEMS;
    } else {
      btn.classList.add('active');
      filterGroup = btnGroup;
    }
    
    this.shuffle.filter(filterGroup);
  }

  _removeActiveClassFromChildren(parent) {
    const { children } = parent;
    for (let i = children.length - 1; i >= 0; i--) {
      children[i].classList.remove('active');
    }
  }

  addSorting() {
    const buttonGroup = document.querySelector('.sort-options');
    if (!buttonGroup) {
      return;
    }
    buttonGroup.addEventListener('change', this._handleSortChange.bind(this));
  }

  _handleSortChange(evt) {
    // Add and remove `active` class from buttons.
    const buttons = Array.from(evt.currentTarget.children);
    buttons.forEach((button) => {
      if (button.querySelector('input').value === evt.target.value) {
        button.classList.add('active');
      } else {
        button.classList.remove('active');
      }
    });
    
    // Create the sort options to give to Shuffle.
    const { value } = evt.target;
    let options = {};
    
    function sortByDate(element) {
      return element.getAttribute('data-created');
    }
    
    function sortByTitle(element) {
      return element.getAttribute('data-title').toLowerCase();
    }
    
    if (value === 'date-created') {
      options = {
        reverse: true,
        by: sortByDate,
      };
    } else if (value === 'title') {
      options = {
        by: sortByTitle,
      };
    }
    this.shuffle.sort(options);
  }

  // Advanced filtering
  addSearchFilter() {
    const searchInput = document.querySelector('.js-shuffle-search');
    if (!searchInput) {
      return;
    }
    searchInput.addEventListener('keyup', this._handleSearchKeyup.bind(this));
  }

  /**
   * Filter the shuffle instance by items with a title that matches the search input.
   * @param {Event} evt Event object.
   */
  _handleSearchKeyup(evt) {
    const searchText = evt.target.value.toLowerCase();
    this.shuffle.filter((element, shuffle) => {
      // If there is a current filter applied, ignore elements that don't match it.
      if (shuffle.group !== Shuffle.ALL_ITEMS) {
        // Get the item's groups.
        const groups = JSON.parse(element.getAttribute('data-groups'));
        const isElementInCurrentGroup = groups.indexOf(shuffle.group) !== -1;
        // Only search elements in the current group
        if (!isElementInCurrentGroup) {
          return false;
        }
      }
      const titleElement = element.querySelector('.picture-item__title');
      const titleText = titleElement.textContent.toLowerCase().trim();
      return titleText.indexOf(searchText) !== -1;
    });
  }
}

document.addEventListener('DOMContentLoaded', () => {
  if ($('#grid').length > 0) {
    window.demo = new Demo(document.getElementById('grid'));
  }
});
