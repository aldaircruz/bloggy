'use strict'

$(window).load ->

  casperFullImg = do ->
    $('img').each ->
      contentWidth = $('.post-content').outerWidth()
      # Width of the content
      imageWidth = $(this)[0].naturalWidth
      # Original image resolution
      method = if imageWidth >= contentWidth then 'addClass' else 'removeClass'
      $(this)[method] 'full-img'

  $(window).smartresize casperFullImg

$ ->
  el = Itch.app
  el.dataset.page = Itch.context()
  el.dataset.device = Itch.device()

  $('.post-content').fitVids()

  FastClick.attach el unless Itch.is 'device', 'desktop'
