UtilService = ()->
  util = {}


  util.getScrollPos = ->
    scrollPos = 0
    if window.pageYOffset
      scrollPos = window.pageYOffset
    else if document.compatMode && document.compatMode != 'BackCompat'
      scrollPos = document.documentElement.scrollTop
    else if window.body
      scrollPos = document.body.scrollTop
    return scrollPos


  util

require './index'
.factory 'util', UtilService