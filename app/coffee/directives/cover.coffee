config = '../config'

miniHeight = config.homeCoverMinHeight

CoverDirective = ()->
  (scope, elem, attr)->
    bodyHeight = window.innerHeight
    if bodyHeight < miniHeight then bodyHeight = miniHeight
    elem.css 'height', "#{bodyHeight}px"

require './index'
.directive 'cover', CoverDirective

