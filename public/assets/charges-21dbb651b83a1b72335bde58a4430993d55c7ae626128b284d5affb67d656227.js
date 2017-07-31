// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

$(function () {
  var controller = new ScrollMagic.Controller();

  new ScrollMagic.Scene({
    duration: 0,
    offset: 0
  })
  .setTween(new TimelineMax()
    .add(TweenMax.to($("#navbar"), 0, {css:{"background":"lightgreen"}, ease:Power1.easeInOut})))
  .addTo(controller);
})
;
