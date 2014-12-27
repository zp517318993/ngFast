angular = require 'angular'

# angular modules
require 'angular-ui-router'
require './templates/templates.js'
require './controllers/example'
require './services/example'
require './directives/example'

angular.element(document).ready ->
  requires = [
    'ui.router'
    'templates'
    'app.controllers'
    'app.services'
    'app.directives'
  ]


  window.app = angular.module 'app', requires

  angular.module 'app'
  .constant 'AppSettings', require './constants'

  angular.module 'app'
  .config require './routes'

  angular.module 'app'
  .run require './on_run'

  angular.bootstrap document, ['app']
