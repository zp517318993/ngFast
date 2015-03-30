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
collapse = require 'bundle-collapser/plugin'
sourcemap = require 'gulp-sourcemaps'
buffer = require 'vinyl-buffer'
envify = require 'envify/custom'
versionTag = require 'gulp-version-tag'
filter = require 'gulp-filter'
clearDeadCode = require 'unreachable-branch-transform'
intreq = require 'intreq-stream'


buildScript = (file)->
  bundler = browserify
    entries: config.browserify.entries
    extensions: ['.coffee', '.js']
    debug: global.isDebug
    cache: {}
    packageCache: {}
    fullPaths: true
  , watchify.args


  rebundler = ()->
    start = new Date().getTime()
    stream = bundler
    .bundle()

    gutil.log 'Rebundle...'
    stream.on 'error', handleErrors
    .pipe intreq()
    .pipe source file
    .pipe gulpif global.isDebug, buffer()
    .pipe gulpif global.isDebug, sourcemap.init
      loadMaps: true
    .pipe gulpif global.isDebug, sourcemap.write('./')
    .pipe gulpif !global.isDebug, streamify uglify()
    .pipe gulpif !global.isDebug, versionTag __dirname, '../../package.json',
      reuse: true
      autoTagVersion: global.autoTagVersion
      beforeText: '_v'
    .pipe gulp.dest config.scripts.dest
    .pipe filter '**/*.js'
    .pipe browserSync.reload {stream: true}
    end = new Date().getTime()
    time = end - start
    gutil.log gutil.colors.blue('[BS]'), gutil.colors.red("'rebundle'"), gutil.colors.green(time + ' ms')


  bundler
  .transform coffeeify
  .transform envify
    NODE_ENV: global.env
    ip: global.ip
  .transform clearDeadCode
  .transform 'brfs'


  if global.isDebug
    bundler = watchify bundler
    bundler.on 'update', rebundler
  rebundler()

gulp.task 'browserify', ->
  buildScript 'app.js'

