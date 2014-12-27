config = require '../config'
gulp = require 'gulp'
gulpif = require 'gulp-if'
gutil = require 'gulp-util'
source = require 'vinyl-source-stream'
streamify = require 'gulp-streamify'
watchify = require 'watchify'
browserify = require 'browserify'
uglify = require 'gulp-uglify'
handleErrors = require '../util/handleErrors'
browserSync = require 'browser-sync'
coffeeify = require 'caching-coffeeify'
#collapse = require 'bundle-collapser/plugin'

buildScript = (file)->
  bundler = browserify
    entries: config.browserify.entries
    extensions: ['.coffee', '.js']
  , watchify.args


  rebundler = (ids)->
#    console.log ids
    stream = bundler.bundle()
    gutil.log 'Rebundle...'
    stream.on 'error', handleErrors
    .pipe source file
    .pipe gulpif global.isProd, streamify uglify()
    .pipe gulp.dest config.scripts.dest
    .pipe browserSync.reload {stream: true, once: true}

  bundler.transform coffeeify
#  .transform ngAnnotate
  .transform 'brfs'

  if !global.isProd
    bundler = watchify bundler
    bundler.on 'update', rebundler
  rebundler()

gulp.task 'browserify', ->
  buildScript 'app.js'
