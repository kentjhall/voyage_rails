// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

// Home page

$(function () {
  var rf_path = {
    motion : {
      curviness: 1.25,
      autorotate: true,
      values: [
          {x: 0,	y: 0},
          {x: 75,	y: -100},
          {x: 0,	y: -175},
          {x: -75,	y: -250},
      ]
    }
  };
  var yf_path = {
    motion : {
      curviness: 1.25,
      autorotate: true,
      values: [
          {x: 0,	y: -100},
          {x: 0,	y: -175},
          {x: 0,	y: -250},
      ]
    }
  };
  var bf_path = {
    motion : {
      curviness: 1.25,
      autorotate: true,
      values: [
          {x: 0,	y: 0},
          {x: -75,	y: -100},
          {x: 0,	y: -175},
          {x: 75,	y: -250},
      ]
    }
  };

  var controller = new ScrollMagic.Controller();

  var rf_tween = TweenMax.to($("#red-flower"), 1, {css:{bezier:rf_path.motion}, ease:Power1.easeInOut});

  var yf_tween = TweenMax.to($("#yellow-flower"), 1, {css:{bezier:yf_path.motion}, ease:Power1.easeInOut});

  var bf_tween = TweenMax.to($("#blue-flower"), 1, {css:{bezier:bf_path.motion}, ease:Power1.easeInOut});

  new ScrollMagic.Scene({
    duration: $('#main').height(),
    offset: 0
  })
  .setTween(rf_tween)
  .addTo(controller);

  new ScrollMagic.Scene({
    duration: $('#main').height(),
    offset: 0
  })
  .setTween(yf_tween)
  .addTo(controller);

  new ScrollMagic.Scene({
    duration: $('#main').height(),
    offset: 0
  })
  .setTween(bf_tween)
  .addTo(controller);
})
