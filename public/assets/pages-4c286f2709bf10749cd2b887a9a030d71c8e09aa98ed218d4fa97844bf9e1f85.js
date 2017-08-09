// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

// Home page

$(function () {
  var controller = new ScrollMagic.Controller();

  TweenMax.to($("#navbar"), 0, {css:{"background":"none"}, ease:Power1.easeInOut});

  var store_nav_tween = TweenMax.to($("#navbar"), 0, {css:{"background":"lightblue"}, ease:Power1.easeInOut});

  var down_arrow_tween = TweenMax.to($("#down_arrow, #down_arrow_text"), 1, {css:{"opacity":"0"}, ease:Power1.easeInOut});

  new ScrollMagic.Scene({
    triggerElement: "#store_trigger",
    duration: 0,
    offset: 0
  })
  .setTween(store_nav_tween)
  .addTo(controller);

  new ScrollMagic.Scene({
    duration: 100,
    offset: 0
  })
  .setTween(down_arrow_tween)
  .addTo(controller);
})
;
