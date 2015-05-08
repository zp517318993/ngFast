(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({"./app/coffee/app.coffee":[function(require,module,exports){
require(7);

require(8);

require(9);

require(2);

require(6);

require(3);

angular.element(document).ready(function() {
  var requires;
  requires = ['ui.router', 'templates', 'app.controllers', 'app.services', 'app.directives'];
  angular.module('app', requires).constant('AppSettings', require(1)).config(require(5)).run(require(4));
  return angular.bootstrap(document, ['app']);
});
},{"1":"/Users/soliury/soliury/work/git/ngFast/app/coffee/constants.coffee","2":"/Users/soliury/soliury/work/git/ngFast/app/coffee/controllers/index.coffee","3":"/Users/soliury/soliury/work/git/ngFast/app/coffee/directives/index.coffee","4":"/Users/soliury/soliury/work/git/ngFast/app/coffee/on_run.coffee","5":"/Users/soliury/soliury/work/git/ngFast/app/coffee/routes.coffee","6":"/Users/soliury/soliury/work/git/ngFast/app/coffee/services/index.coffee","7":"angular","8":"angular-ui-router","9":"templates.js"}],"/Users/soliury/soliury/work/git/ngFast/app/coffee/config.coffee":[function(require,module,exports){
var baseConfig, devLocal, devOnline, extendConfig, ip, production;

ip = "192.168.0.100";

production = {
  baseApi: 'http://lingyong.me'
};

devOnline = {
  baseApi: 'http://test.lingyong.me'
};

devLocal = {
  baseApi: "http://" + ip + ":3000"
};

baseConfig = {
  homeCoverMinHeight: 500
};

extendConfig = (function() {
  switch ("dev") {
    case 'dev-online':
      return devOnline;
    case 'production':
      return production;
    default:
      return devLocal;
  }
})();

angular.extend(baseConfig, extendConfig);

module.exports = baseConfig;
},{}],"/Users/soliury/soliury/work/git/ngFast/app/coffee/constants.coffee":[function(require,module,exports){
var AppSettings, config;

config = require(1);

AppSettings = {
  appTitle: 'NgFast · A boilerplate using AngularJS, Coffee, SASS, Gulp, and Browserify',
  apiUrl: config.baseApi
};

module.exports = AppSettings;
},{"1":"/Users/soliury/soliury/work/git/ngFast/app/coffee/config.coffee"}],"/Users/soliury/soliury/work/git/ngFast/app/coffee/controllers/example.coffee":[function(require,module,exports){
var ExampleCtrl, controllersModule;

controllersModule = require(1);

ExampleCtrl = function() {
  var vm;
  vm = this;
  vm.title = 'AngularJS, Gulp, and Browserify';
  return vm.number = 1234;
};

controllersModule.controller('ExampleCtrl', ExampleCtrl);
},{"1":"/Users/soliury/soliury/work/git/ngFast/app/coffee/controllers/index.coffee"}],"/Users/soliury/soliury/work/git/ngFast/app/coffee/controllers/index.coffee":[function(require,module,exports){
require(2);

module.exports = angular.module('app.controllers', []);

require(1);
},{"1":"/Users/soliury/soliury/work/git/ngFast/app/coffee/controllers/example.coffee","2":"angular"}],"/Users/soliury/soliury/work/git/ngFast/app/coffee/directives/cover.coffee":[function(require,module,exports){
var CoverDirective, config, miniHeight;

config = '../config';

miniHeight = config.homeCoverMinHeight;

CoverDirective = function() {
  return function(scope, elem, attr) {
    var bodyHeight;
    bodyHeight = window.innerHeight;
    if (bodyHeight < miniHeight) {
      bodyHeight = miniHeight;
    }
    return elem.css('height', bodyHeight + "px");
  };
};

require(1).directive('cover', CoverDirective);
},{"1":"/Users/soliury/soliury/work/git/ngFast/app/coffee/directives/index.coffee"}],"/Users/soliury/soliury/work/git/ngFast/app/coffee/directives/example.coffee":[function(require,module,exports){
var directivesModule, exampleDirective;

directivesModule = require(1);

exampleDirective = function() {
  var directive;
  directive = {
    restrict: 'EA',
    link: function($scope, $element) {
      return $element.on('click', function() {
        return console.log('element clicked');
      });
    }
  };
  return directive;
};

directivesModule.directive('exampleDirective', exampleDirective);
},{"1":"/Users/soliury/soliury/work/git/ngFast/app/coffee/directives/index.coffee"}],"/Users/soliury/soliury/work/git/ngFast/app/coffee/directives/index.coffee":[function(require,module,exports){
require(4);

module.exports = angular.module('app.directives', []);

require(2);

require(1);

require(3);
},{"1":"/Users/soliury/soliury/work/git/ngFast/app/coffee/directives/cover.coffee","2":"/Users/soliury/soliury/work/git/ngFast/app/coffee/directives/example.coffee","3":"/Users/soliury/soliury/work/git/ngFast/app/coffee/directives/well.coffee","4":"angular"}],"/Users/soliury/soliury/work/git/ngFast/app/coffee/directives/well.coffee":[function(require,module,exports){
var WellDirective;

WellDirective = function($window, util) {
  return function(scope, elem, attr) {
    return angular.element($window).bind('scroll', function() {
      var height, o, scrollPos;
      scrollPos = util.getScrollPos();
      height = window.innerHeight;
      o = 1 - (scrollPos / height);
      if (o > 0) {
        return elem.css('background-image', "linear-gradient(180deg, rgba(0, 0, 0, 0.16) 0, rgba(0, 0, 0, " + o + ") 100%)");
      }
    });
  };
};

WellDirective.$inject = ['$window', 'util'];

require(1).directive('well', WellDirective);
},{"1":"/Users/soliury/soliury/work/git/ngFast/app/coffee/directives/index.coffee"}],"/Users/soliury/soliury/work/git/ngFast/app/coffee/on_run.coffee":[function(require,module,exports){
var OnRun;

OnRun = function($rootScope, AppSettings) {
  return $rootScope.$on('$stateChangeSuccess', function(event, toState) {
    $rootScope.pageTitle = '';
    if (toState.title) {
      $rootScope.pageTitle += toState.title;
      $rootScope.pageTitle += ' · ';
    }
    return $rootScope.pageTitle += AppSettings.appTitle;
  });
};

OnRun.$inject = ['$rootScope', 'AppSettings'];

module.exports = OnRun;
},{}],"/Users/soliury/soliury/work/git/ngFast/app/coffee/routes.coffee":[function(require,module,exports){
var Routes;

Routes = function($stateProvider, $locationProvider, $urlRouterProvider) {
  $locationProvider.html5Mode(true);
  $stateProvider.state('Home', {
    url: '/',
    controller: 'ExampleCtrl as home',
    templateUrl: 'home.html'
  });
  return $urlRouterProvider.otherwise('/');
};

Routes.$inject = ['$stateProvider', '$locationProvider', '$urlRouterProvider'];

module.exports = Routes;
},{}],"/Users/soliury/soliury/work/git/ngFast/app/coffee/services/example.coffee":[function(require,module,exports){
var ExampleService, servicesModule;

servicesModule = require(1);

ExampleService = function($q, $http, AppSettings) {
  var service;
  service = {};
  service.get = function() {
    var deferred;
    deferred = $q.defer();
    $http.get(AppSettings.apiUrl + '/getinfo').success(function(data) {
      return deferred.resolve(data);
    }).error(function(err, status) {
      return deferred.reject(err, status);
    });
    return deferred.promise;
  };
  return service;
};

ExampleService.$inject = ['$q', '$http', 'AppSettings'];

servicesModule.service('ExampleService', ExampleService);
},{"1":"/Users/soliury/soliury/work/git/ngFast/app/coffee/services/index.coffee"}],"/Users/soliury/soliury/work/git/ngFast/app/coffee/services/index.coffee":[function(require,module,exports){
require(3);

module.exports = angular.module('app.services', []);

require(1);

require(2);
},{"1":"/Users/soliury/soliury/work/git/ngFast/app/coffee/services/example.coffee","2":"/Users/soliury/soliury/work/git/ngFast/app/coffee/services/util.coffee","3":"angular"}],"/Users/soliury/soliury/work/git/ngFast/app/coffee/services/util.coffee":[function(require,module,exports){
var UtilService;

UtilService = function() {
  var util;
  util = {};
  util.getScrollPos = function() {
    var scrollPos;
    scrollPos = 0;
    if (window.pageYOffset) {
      scrollPos = window.pageYOffset;
    } else if (document.compatMode && document.compatMode !== 'BackCompat') {
      scrollPos = document.documentElement.scrollTop;
    } else if (window.body) {
      scrollPos = document.body.scrollTop;
    }
    return scrollPos;
  };
  return util;
};

require(1).factory('util', UtilService);
},{"1":"/Users/soliury/soliury/work/git/ngFast/app/coffee/services/index.coffee"}]},{},["./app/coffee/app.coffee"]);

//# sourceMappingURL=app.js.map