config = require '../config'
gulp = require 'gulp'
templateCache = require 'gulp-angular-templatecache'
htmlmin = require 'gulp-htmlmin'
gulpif = require 'gulp-if'
htmlreplace = require 'gulp-html-replace'


gulp.task 'views', ->
  gulp.src 'app/index.html'
  .pipe gulpif !global.isDebug, htmlreplace
    'css': "/css/main-#{global.buildTime}.css"
    'js': "/js/app-#{global.buildTime}.js"
  .pipe gulpif !global.isDebug, htmlmin
    removeComments: true
    collapseWhitespace: true
  .pipe gulp.dest config.dist.root

  gulp.src config.views.src
  .pipe gulpif !global.isDebug, htmlmin
    removeComments: true
    collapseWhitespace: true
  .pipe templateCache
    standalone: true
  .pipe gulp.dest config.views.dest