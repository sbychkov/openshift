# jQuery for page scrolling feature - requires jQuery Easing plugin
$ ->
  $('a.page-scroll').bind 'click', (event) ->
    $anchor = $(this)
    $('html, body').stop().animate {scrollTop: $($anchor.attr('href')).offset().top}, 1500, 'easeInOutExpo'
    event.preventDefault()
    return
  return
# Highlight the top nav as scrolling occurs
$('body').scrollspy target: '.navbar-fixed-top'
# Closes the Responsive Menu on Menu Item Click
$('.navbar-collapse ul li a').click ->
  $('.navbar-toggle:visible').click()
  return


