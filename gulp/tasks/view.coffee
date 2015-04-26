gulp = require 'gulp'
templateCache = require 'gulp-angular-templatecache'
htmlmin = require 'gulp-htmlmin'
gulpif = require 'gulp-if'
htmlreplace = require 'gulp-html-replace'
duration = require 'gulp-duration'
source = require 'vinyl-source-stream'
browserify = require 'browserify'
transform = require 'vinyl-transform'
browserSync = require 'browser-sync'


config = require '../config'


gulp.task 'views', ->
  {isDebug} = global

  browserified = transform (filename)->
    b = browserify()
    b.require 'templates.js'
    b.bundle()


  if isDebug
    name = 'templates.js'
  else
    name = "templates_v#{global.versionTag}.js"


  gulp.src config.views.src
  .pipe gulpif isDebug, htmlmin
    removeComments: true
    collapseWhitespace: true
  .pipe templateCache name,
    standalone: true
  .pipe gulp.dest config.views.dest
  .pipe browserified
  .pipe gulp.dest config.scripts.dest
  .pipe browserSync.reload
    stream: true


gulp.task 'index', ->
  {isDebug, versionTag} = global
  pathPrefix = '/build/production'

  gulp.src 'app/index.html'
  .pipe gulpif !isDebug, htmlreplace
    'css': "#{pathPrefix}/css/main_v#{versionTag}.css"
    'vendor': "#{pathPrefix}/js/vendor_v#{versionTag}.js"
    'app': "#{pathPrefix}/js/app_v#{versionTag}.js"
    'templates': "#{pathPrefix}/js/templates_v#{versionTag}.js"
  .pipe gulpif !isDebug, htmlmin
    removeComments: true
    collapseWhitespace: true
  .pipe gulp.dest './'
  .pipe browserSync.reload
    stream: true
