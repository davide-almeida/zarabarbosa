/*
	By André Rinas, www.andreknieriem.de
	Available for use under the MIT License
*/

!function(a,b,c,d){"use strict";a.fn.simpleLightbox=function(d){var t,d=a.extend({overlay:!0,spinner:!0,nav:!0,navText:["&lsaquo;","&rsaquo;"],captions:!0,captionDelay:0,captionSelector:"img",captionType:"attr",captionsData:"title",captionPosition:"bottom",close:!0,closeText:"×",swipeClose:!0,showCounter:!0,fileExt:"png|jpg|jpeg|gif",animationSlide:!0,animationSpeed:250,preloading:!0,enableKeyboard:!0,loop:!0,rel:!1,docClose:!0,swipeTolerance:50,className:"simple-lightbox",widthRatio:.8,heightRatio:.9,disableRightClick:!1,disableScroll:!0,alertError:!0,alertErrorMessage:"Image not found, next image will be loaded",additionalHtml:!1,history:!0},d),h=(b.navigator.pointerEnabled||b.navigator.msPointerEnabled,0),i=0,j=a(),k=function(){var a=c.body||c.documentElement;return a=a.style,""===a.WebkitTransition?"-webkit-":""===a.MozTransition?"-moz-":""===a.OTransition?"-o-":""===a.transition&&""},l=!1,m=[],n=function(b,c){var d=a(c.selector).filter(function(){return a(this).attr("rel")===b});return d},o=d.rel&&d.rel!==!1?n(d.rel,this):this,k=k(),p=0,q=k!==!1,r="pushState"in history,s=!1,u=b.location,v=function(){return u.hash.substring(1)},w=v(),x=function(){var b=(v(),"pid="+(H+1)),d=u.href.split("#")[0]+"#"+b;r?history[s?"replaceState":"pushState"]("",c.title,d):s?u.replace(d):u.hash=b,s=!0},y=function(){r?history.pushState("",c.title,u.pathname+u.search):u.hash="",clearTimeout(t)},z=function(){s?t=setTimeout(x,800):x()},A="simplelb",B=a("<div>").addClass("sl-overlay"),C=a("<button>").addClass("sl-close").html(d.closeText),D=a("<div>").addClass("sl-spinner").html("<div></div>"),E=a("<div>").addClass("sl-navigation").html('<button class="sl-prev">'+d.navText[0]+'</button><button class="sl-next">'+d.navText[1]+"</button>"),F=a("<div>").addClass("sl-counter").html('<span class="sl-current"></span>/<span class="sl-total"></span>'),G=!1,H=0,I=a("<div>").addClass("sl-caption pos-"+d.captionPosition),J=a("<div>").addClass("sl-image"),K=a("<div>").addClass("sl-wrapper").addClass(d.className),L=function(b){return!d.fileExt||"a"==a(b).prop("tagName").toLowerCase()&&new RegExp(".("+d.fileExt+")$","i").test(a(b).attr("href"))},M=function(){d.close&&C.appendTo(K),d.showCounter&&o.length>1&&(F.appendTo(K),F.find(".sl-total").text(o.length)),d.nav&&E.appendTo(K),d.spinner&&D.appendTo(K)},N=function(b){b.trigger(a.Event("show.simplelightbox")),d.disableScroll&&(p=W("hide")),K.appendTo("body"),J.appendTo(K),d.overlay&&B.appendTo(a("body")),G=!0,H=o.index(b),j=a("<img/>").hide().attr("src",b.attr("href")),m.indexOf(b.attr("href"))==-1&&m.push(b.attr("href")),J.html("").attr("style",""),j.appendTo(J),R(),B.fadeIn("fast"),a(".sl-close").fadeIn("fast"),D.show(),E.fadeIn("fast"),a(".sl-wrapper .sl-counter .sl-current").text(H+1),F.fadeIn("fast"),O(),d.preloading&&T(),setTimeout(function(){b.trigger(a.Event("shown.simplelightbox"))},d.animationSpeed)},O=function(c){if(j.length){var e=new Image,f=a(b).width()*d.widthRatio,g=a(b).height()*d.heightRatio;e.src=j.attr("src"),a(e).bind("error",function(b){o.eq(H).trigger(a.Event("error.simplelightbox")),G=!1,l=!0,D.hide(),d.alertError&&alert(d.alertErrorMessage),U(1==c||c==-1?c:1)}),e.onload=function(){"undefined"!=typeof c&&o.eq(H).trigger(a.Event("changed.simplelightbox")).trigger(a.Event((1===c?"nextDone":"prevDone")+".simplelightbox")),d.history&&z(),m.indexOf(j.attr("src"))==-1&&m.push(j.attr("src"));var h=e.width,i=e.height;if(h>f||i>g){var k=h/i>f/g?h/f:i/g;h/=k,i/=k}a(".sl-image").css({top:(a(b).height()-i)/2+"px",left:(a(b).width()-h-p)/2+"px"}),D.hide(),j.css({width:h+"px",height:i+"px"}).fadeIn("fast"),l=!0;var r,n="self"==d.captionSelector?o.eq(H):o.eq(H).find(d.captionSelector);if(r="data"==d.captionType?n.data(d.captionsData):"text"==d.captionType?n.html():n.prop(d.captionsData),d.loop||(0===H&&a(".sl-prev").hide(),H>=o.length-1&&a(".sl-next").hide(),H>0&&a(".sl-prev").show(),H<o.length-1&&a(".sl-next").show()),1==o.length&&a(".sl-prev, .sl-next").hide(),1==c||c==-1){var s={opacity:1};d.animationSlide&&(q?(Q(0,100*c+"px"),setTimeout(function(){Q(d.animationSpeed/1e3,"0px"),50})):s.left=parseInt(a(".sl-image").css("left"))+100*c+"px"),a(".sl-image").animate(s,d.animationSpeed,function(){G=!1,P(r)})}else G=!1,P(r);d.additionalHtml&&0===a(".sl-additional-html").length&&a("<div>").html(d.additionalHtml).addClass("sl-additional-html").appendTo(a(".sl-image"))}}},P=function(b){""!==b&&"undefined"!=typeof b&&d.captions&&I.html(b).hide().appendTo(a(".sl-image")).delay(d.captionDelay).fadeIn("fast")},Q=function(b,c){var d={};d[k+"transform"]="translateX("+c+")",d[k+"transition"]=k+"transform "+b+"s linear",a(".sl-image").css(d)},R=function(){a(b).on("resize."+A,O),a(c).on("click."+A+" touchstart."+A,".sl-close",function(a){a.preventDefault(),l&&V()}),d.history&&setTimeout(function(){a(b).on("hashchange."+A,function(){if(l&&v()===w)return void V()})},40),E.on("click."+A,"button",function(b){b.preventDefault(),h=0,U(a(this).hasClass("sl-next")?1:-1)});var e=0,f=0,g=0,j=0,k=!1,m=0;J.on("touchstart."+A+" mousedown."+A,function(a){return!!k||(q&&(m=parseInt(J.css("left"))),k=!0,e=a.originalEvent.pageX||a.originalEvent.touches[0].pageX,g=a.originalEvent.pageY||a.originalEvent.touches[0].pageY,!1)}).on("touchmove."+A+" mousemove."+A+" pointermove MSPointerMove",function(a){return!k||(a.preventDefault(),f=a.originalEvent.pageX||a.originalEvent.touches[0].pageX,j=a.originalEvent.pageY||a.originalEvent.touches[0].pageY,h=e-f,i=g-j,void(d.animationSlide&&(q?Q(0,-h+"px"):J.css("left",m-h+"px"))))}).on("touchend."+A+" mouseup."+A+" touchcancel."+A+" mouseleave."+A+" pointerup pointercancel MSPointerUp MSPointerCancel",function(a){if(k){k=!1;var b=!0;d.loop||(0===H&&h<0&&(b=!1),H>=o.length-1&&h>0&&(b=!1)),Math.abs(h)>d.swipeTolerance&&b?U(h>0?1:-1):d.animationSlide&&(q?Q(d.animationSpeed/1e3,"0px"):J.animate({left:m+"px"},d.animationSpeed/2)),d.swipeClose&&Math.abs(i)>50&&Math.abs(h)<d.swipeTolerance&&V()}})},S=function(){E.off("click","button"),a(c).off("click."+A,".sl-close"),a(b).off("resize."+A),a(b).off("hashchange."+A)},T=function(){var b=H+1<0?o.length-1:H+1>=o.length-1?0:H+1,c=H-1<0?o.length-1:H-1>=o.length-1?0:H-1;a("<img />").attr("src",o.eq(b).attr("href")).on("load",function(){m.indexOf(a(this).attr("src"))==-1&&m.push(a(this).attr("src")),o.eq(H).trigger(a.Event("nextImageLoaded.simplelightbox"))}),a("<img />").attr("src",o.eq(c).attr("href")).on("load",function(){m.indexOf(a(this).attr("src"))==-1&&m.push(a(this).attr("src")),o.eq(H).trigger(a.Event("prevImageLoaded.simplelightbox"))})},U=function(b){o.eq(H).trigger(a.Event("change.simplelightbox")).trigger(a.Event((1===b?"next":"prev")+".simplelightbox"));var c=H+b;if(!(G||(c<0||c>=o.length)&&d.loop===!1)){H=c<0?o.length-1:c>o.length-1?0:c,a(".sl-wrapper .sl-counter .sl-current").text(H+1);var e={opacity:0};d.animationSlide&&(q?Q(d.animationSpeed/1e3,-100*b-h+"px"):e.left=parseInt(a(".sl-image").css("left"))+-100*b+"px"),a(".sl-image").animate(e,d.animationSpeed,function(){setTimeout(function(){var c=o.eq(H);j.attr("src",c.attr("href")),m.indexOf(c.attr("href"))==-1&&D.show(),a(".sl-caption").remove(),O(b),d.preloading&&T()},100)})}},V=function(){if(!G){var b=o.eq(H),c=!1;b.trigger(a.Event("close.simplelightbox")),d.history&&y(),a(".sl-image img, .sl-overlay, .sl-close, .sl-navigation, .sl-image .sl-caption, .sl-counter").fadeOut("fast",function(){d.disableScroll&&W("show"),a(".sl-wrapper, .sl-overlay").remove(),S(),c||b.trigger(a.Event("closed.simplelightbox")),c=!0}),j=a(),l=!1,G=!1}},W=function(d){var e=0;if("hide"==d){var f=b.innerWidth;if(!f){var g=c.documentElement.getBoundingClientRect();f=g.right-Math.abs(g.left)}if(c.body.clientWidth<f){var h=c.createElement("div"),i=parseInt(a("body").css("padding-right"),10);h.className="sl-scrollbar-measure",a("body").append(h),e=h.offsetWidth-h.clientWidth,a(c.body)[0].removeChild(h),a("body").data("padding",i),e>0&&a("body").addClass("hidden-scroll").css({"padding-right":i+e})}}else a("body").removeClass("hidden-scroll").css({"padding-right":a("body").data("padding")});return e};return M(),o.on("click."+A,function(b){if(L(this)){if(b.preventDefault(),G)return!1;N(a(this))}}),a(c).on("click."+A+" touchstart."+A,function(b){l&&d.docClose&&0===a(b.target).closest(".sl-image").length&&0===a(b.target).closest(".sl-navigation").length&&V()}),d.disableRightClick&&a(c).on("contextmenu",".sl-image img",function(a){return!1}),d.enableKeyboard&&a(c).on("keyup."+A,function(a){if(a.preventDefault(),h=0,l){var b=a.keyCode;27==b&&V(),37!=b&&39!=a.keyCode||U(39==a.keyCode?1:-1)}}),this.open=function(b){b=b||a(this[0]),N(b)},this.next=function(){U(1)},this.prev=function(){U(-1)},this.close=function(){V()},this.destroy=function(){a(c).unbind("click."+A).unbind("keyup."+A),V(),a(".sl-overlay, .sl-wrapper").remove(),this.off("click")},this.refresh=function(){this.destroy(),a(this.selector).simpleLightbox(d)},this}}(jQuery,window,document);