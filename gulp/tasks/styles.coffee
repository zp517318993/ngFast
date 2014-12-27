config = require '../config'
gulp = require 'gulp'
sass = require 'gulp-sass'
gulpif = require 'gulp-if'
handleErrors = require '../util/handleErrors'
browserSync = require 'browser-sync'
autoprefixer = require 'gulp-autoprefixer'
cache = require 'gulp-cached'
plumber = require 'gulp-plumber'

gulp.task 'styles', ->
  gulp.src config.styles.src
  .pipe plumber()
  .pipe cache 'styles'
  .pipe sass
    sourceComments: global.isProd ? 'none': 'map'
    sourceMap: 'sass'
    outputStyle: global.isProd ? 'compressed': 'nested'
  .pipe autoprefixer "last 2 versions", "> 1%", "ie 8"
  .on 'error', handleErrors
  .pipe plumber.stop()
  .pipe gulp.dest config.styles.dest
  .pipe gulpif browserSync.active, browserSync.reload {stream: true}
