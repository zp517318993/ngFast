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
coffeeify = require 'coffeeify'
collapse = require 'bundle-collapser/plugin'
sourcemap = require 'gulp-sourcemaps'
buffer = require 'vinyl-buffer'
envify = require 'envify/custom'
versionTag = require 'gulp-version-tag'


buildScript = (file)->
  bundler = browserify
    entries: config.browserify.entries
    extensions: ['.coffee', '.js']
    debug: global.isDebug
  , watchify.args


  rebundler = ()->
    stream = bundler
    .bundle()

    gutil.log 'Rebundle...'
    stream.on 'error', handleErrors
    .pipe source file
    .pipe gulpif global.isDebug, buffer()
    .pipe gulpif global.isDebug, sourcemap.init
      loadMaps: true
    .pipe gulpif global.isDebug, sourcemap.write('./')
    .pipe gulpif !global.isDebug, streamify uglify()
    .pipe gulpif !global.isDebug, versionTag __dirname, '../../package.json',
      reuse: true
      autoTagVersion: global.autoTagVersion
    .pipe gulp.dest config.scripts.dest
    .pipe browserSync.reload {stream: true, once: true}

  bundler
  .transform coffeeify
  .transform envify
    NODE_ENV: global.env
    ip: global.ip
  .transform 'brfs'


  if global.isDebug
    bundler = watchify bundler
    bundler.on 'update', rebundler
  rebundler()

gulp.task 'browserify', ->
  buildScript 'app.js'

