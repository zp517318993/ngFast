Routes = ($stateProvider, $locationProvider, $urlRouterProvider)->
  $locationProvider.html5Mode true

  $stateProvider.state 'Home',
    url: '/'
    controller: 'ExampleCtrl as home'
    templateUrl: 'home.html'
    title: 'Homafadasfe'

  $urlRouterProvider.otherwise '/'

Routes.$inject= ['$stateProvider', '$locationProvider', '$urlRouterProvider']

module.exports = Routes