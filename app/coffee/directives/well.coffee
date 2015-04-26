WellDirective = ($window, util)->
  (scope, elem, attr)->
    angular.element($window).bind 'scroll', ->
      scrollPos = util.getScrollPos()
      height = window.innerHeight

      o = 1 - (scrollPos / height)

      if o > 0
        elem.css 'background-image', """
            linear-gradient(180deg, rgba(0, 0, 0, 0.16) 0, rgba(0, 0, 0, #{o}) 100%)
          """

WellDirective.$inject = ['$window', 'util']

require './index'
.directive 'well', WellDirective