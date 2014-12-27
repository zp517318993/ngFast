controllersModule = require './_index'


ExampleCtrl = ->
  vm = @
  vm.title = 'AngularJS, Gulp, and Browserify'
  vm.number = 1234


controllersModule.controller 'ExampleCtrl', ExampleCtrl