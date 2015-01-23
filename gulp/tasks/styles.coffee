config = require '../config'
gulp = require 'gulp'
sass = require 'gulp-sass'
gulpif = require 'gulp-if'
handleErrors = require '../util/handleErrors'
browserSync = require 'browser-sync'
autoprefixer = require 'gulp-autoprefixer'
plumber = require 'gulp-plumber'
sourcemaps = require 'gulp-sourcemaps'
cssmin = require 'gulp-minify-css'
rename = require 'gulp-rename'


gulp.task 'styles', ->
  gulp.src config.styles.src
  .pipe plumber
    errorHandler: handleErrors
  .pipe gulpif global.isDebug, sourcemaps.init()
  .pipe sass
    sourcemap: true
    style: 'compact'
  .pipe gulpif global.isDebug, sourcemaps.write('.')
  .pipe gulpif !global.isDebug, autoprefixer "last 2 versions", "> 1%", "ie 8"
  .pipe gulpif !global.isDebug, cssmin()
  .pipe gulpif !global.isDebug, rename (path)->
    path.dirname += "";
    path.basename += "-#{global.buildTime}";
    path.extname += ''
    return
  .pipe gulp.dest config.styles.dest
  .pipe gulpif browserSync.active, browserSync.reload {stream: true}
