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

  // var rf_path = {
  //   motion : {
  //     curviness: 1.25,
  //     autorotate: true,
  //     values: [
  //         {x: 0,	y: 0},
  //         {x: 75,	y: 0},
  //     ]
  //   }
  // };
  // var yf_path = {
  //   motion : {
  //     curviness: 1.25,
  //     autorotate: true,
  //     values: [
  //         {x: 0,	y: 0},
  //         {x: 0,	y: 0},
  //         {x: 0,	y: 0},
  //     ]
  //   }
  // };
  // var bf_path = {
  //   motion : {
  //     curviness: 1.25,
  //     autorotate: true,
  //     values: [
  //         {x: 0,	y: 0},
  //         {x: -75,	y: 0},
  //     ]
  //   }
  // };

  var controller = new ScrollMagic.Controller();

  var rf_tween = new TimelineMax()
    .add(TweenMax.to($("#red-flower"), 1, {css:{bezier:rf_path.motion}, ease:Power1.easeInOut}));

  var yf_tween = new TimelineMax()
    .add(TweenMax.to($("#yellow-flower"), 1, {css:{bezier:yf_path.motion}, ease:Power1.easeInOut}));

  var bf_tween = new TimelineMax()
    .add(TweenMax.to($("#blue-flower"), 1, {css:{bezier:bf_path.motion}, ease:Power1.easeInOut}));

  var nav_tween = new TimelineMax()
    .add(TweenMax.to($("#navbar"), 0, {css:{"color":"white", "box-shadow":"0 0.2em 1em black"}, ease:Power1.easeInOut}));

  var nav_links_tween = new TimelineMax()
    .add(TweenMax.to($("#navbar a"), 0, {css:{"color":"white"}, ease:Power1.easeInOut}));

  var store_nav_tween = new TimelineMax()
    .add(TweenMax.to($("#navbar"), 0, {css:{"background":"lightblue"}, ease:Power1.easeInOut}));

  var about_us_nav_tween = new TimelineMax()
    .add(TweenMax.to($("#navbar"), 0, {css:{"background":"lightpink"}, ease:Power1.easeInOut}));

  var contact_nav_tween = new TimelineMax()
    .add(TweenMax.to($("#navbar"), 0, {css:{"background":"lightgreen"}, ease:Power1.easeInOut}));

  var nav_color_transition = new TimelineMax()
    .add(TweenMax.to($("#navbar"), 0, {css:{"transition":"background .15s ease-in"}, ease:Power1.easeInOut}));

  var down_arrow_tween = new TimelineMax()
    .add(TweenMax.to($("#down_arrow, #down_arrow_text"), 1, {css:{"opacity":"0"}, ease:Power1.easeInOut}));

  var store_title_tween = new TimelineMax()
    .add(TweenMax.to($("#store_title"), 1, {css:{"opacity":"0"}, ease:Power1.easeInOut}));

  var about_us_title_tween = new TimelineMax()
    .add(TweenMax.to($("#about_us_title"), 1, {css:{"opacity":"0"}, ease:Power1.easeInOut}));

  var contact_title_tween = new TimelineMax()
    .add(TweenMax.to($("#contact_title"), 1, {css:{"opacity":"0"}, ease:Power1.easeInOut}));

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

  new ScrollMagic.Scene({
    triggerElement: ".trigger",
    duration: 0,
    offset: 0
  })
  .setTween(nav_tween)
  .addTo(controller);

  new ScrollMagic.Scene({
    triggerElement: ".trigger",
    duration: 0,
    offset: 0
  })
  .setTween(nav_links_tween)
  .addTo(controller);

  new ScrollMagic.Scene({
    triggerElement: "#main",
    duration: 0,
    offset: 0
  })
  .setTween(new TimelineMax()
    .add(TweenMax.to($("#navbar"), 0, {css:{"background":"none"}, ease:Power1.easeInOut})))
  .addTo(controller);

  new ScrollMagic.Scene({
    triggerElement: "#store_trigger",
    duration: 0,
    offset: 0
  })
  .setTween(store_nav_tween)
  .addTo(controller);

  new ScrollMagic.Scene({
    triggerElement: "#about_us_trigger",
    duration: 0,
    offset: 0
  })
  .setTween(about_us_nav_tween)
  .addTo(controller);

  new ScrollMagic.Scene({
    triggerElement: "#contact_trigger",
    duration: 0,
    offset: 0
  })
  .setTween(contact_nav_tween)
  .addTo(controller);

  new ScrollMagic.Scene({
    triggerElement: "#about_us",
    duration: 0,
    offset: 0
  })
  .setTween(nav_color_transition)
  .addTo(controller);

  new ScrollMagic.Scene({
    duration: 100,
    offset: 0
  })
  .setTween(down_arrow_tween)
  .addTo(controller);

  new ScrollMagic.Scene({
    triggerElement: "#store_trigger",
    duration: $('#navbar').height(),
    offset: -$('#navbar').height()
  })
  .setTween(store_title_tween)
  .addTo(controller);

  new ScrollMagic.Scene({
    triggerElement: "#about_us_trigger",
    duration: $('#navbar').height(),
    offset: -$('#navbar').height()
  })
  .setTween(about_us_title_tween)
  .addTo(controller);

  new ScrollMagic.Scene({
    triggerElement: "#contact_trigger",
    duration: $('#navbar').height(),
    offset: -$('#navbar').height()
  })
  .setTween(contact_title_tween)
  .addTo(controller);
})
