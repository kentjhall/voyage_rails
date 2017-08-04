// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs

//= require aos/dist/aos
//= require scrollmagic/scrollmagic/minified/ScrollMagic.min
//= require scrollmagic/scrollmagic/minified/plugins/animation.gsap.min
//= require gsap/TweenMax
//= require gsap/TimelineMax
//= require gsap/BezierPlugin

// 'require turbolinks' disabled for JS library compatibility

$(function () {
  var controller = new ScrollMagic.Controller();

  TweenMax.to($("#navbar"), 0, {css:{"color":"black", "box-shadow":"none"}, ease:Power1.easeInOut})

  var nav_tween = new TimelineMax()
    .add(TweenMax.to($("#navbar"), 0, {css:{"color":"white", "box-shadow":"0 0.2em 1em black"}, ease:Power1.easeInOut}));

  var nav_links_tween = TweenMax.to($("#navbar a"), 0, {css:{"color":"white"}, ease:Power1.easeInOut});

  TweenMax.to($("#navbar"), 0, {css:{"background":"lightblue"}, ease:Power1.easeInOut});

  var cart_nav_tween = TweenMax.to($("#navbar"), 0, {css:{"background":"lightgreen"}, ease:Power1.easeInOut});

  var about_us_nav_tween = TweenMax.to($("#navbar"), 0, {css:{"background":"lightpink"}, ease:Power1.easeInOut});

  var contact_nav_tween = TweenMax.to($("#navbar"), 0, {css:{"background":"lightsalmon"}, ease:Power1.easeInOut});

  TweenMax.to($("#navbar"), 0, {css:{"background":document.querySelector('.colored_section').style.backgroundColor}, ease:Power1.easeInOut});

  var nav_color_transition = TweenMax.to($("#navbar"), 0, {css:{"transition":"background .15s ease-in"}, ease:Power1.easeInOut});

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
    triggerElement: "#cart_trigger",
    duration: 0,
    offset: 0
  })
  .setTween(cart_nav_tween)
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
    triggerElement: "#cart",
    duration: 0,
    offset: 0
  })
  .setTween(nav_color_transition)
  .addTo(controller);

  new ScrollMagic.Scene({
    triggerElement: document.querySelector(".trigger"),
    duration: $('#navbar').height(),
    offset: -$('#navbar').height()
  })
  .setTween(TweenMax.to($("#back_arrow_wrapper"), 1, {css:{"opacity":"0"}, ease:Power1.easeInOut}))
  .addTo(controller);

  new ScrollMagic.Scene({
    triggerElement: document.querySelector(".trigger"),
    offset: 0
  })
  .setTween(TweenMax.to($("#back_arrow_nav_wrapper"), 0, {css:{"opacity":"1"}, ease:Power1.easeInOut}))
  .addTo(controller);

  var titles = document.getElementsByTagName('h2');
  for (var i=0; i<titles.length; i++) {
    new ScrollMagic.Scene({
      triggerElement: document.getElementById(titles[i].id.replace('_title','_trigger')),
      duration: $('#navbar').height(),
      offset: -$('#navbar').height()
    })
    .setTween(TweenMax.to($(titles[i]), 1, {css:{"opacity":"0"}, ease:Power1.easeInOut}))
    .addTo(controller);
  }
})
