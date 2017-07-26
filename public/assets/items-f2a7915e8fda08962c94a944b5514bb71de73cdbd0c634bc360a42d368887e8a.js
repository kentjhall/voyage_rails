// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

$(function () {
  var controller = new ScrollMagic.Controller();

  var item_title_tween = TweenMax.to($("#item_title"), 1, {css:{"opacity":"0"}, ease:Power1.easeInOut});

  new ScrollMagic.Scene({
    triggerElement: "#item_trigger",
    duration: $('#navbar').height(),
    offset: -$('#navbar').height()
  })
  .setTween(item_title_tween)
  .addTo(controller);

  new ScrollMagic.Scene({
    duration: 0,
    offset: 0
  })
  .setTween(new TimelineMax()
    .add(TweenMax.to($("#navbar"), 0, {css:{"background":"lightblue"}, ease:Power1.easeInOut})))
  .addTo(controller);
})
;
