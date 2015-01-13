gulp = require 'gulp'
runSequence = require 'run-sequence'

gulp.task 'build', ['clean'], (cb)->
  cb = cb || ()->

  global.isDebug = false
  if process.env.NODE_ENV == 'production'
    global.env = 'production'
  else
    global.env = 'dev-online'
  runSequence 'styles', 'images', 'views', 'browserify', cb


gulp.task 'dev', ['clean'], (cb)->
  cb = cb || ()->

  global.isDebug = true

  runSequence 'styles', 'images', 'views', 'browserify', 'watch', cb


gulp.task 'dev-online', (cb)->
  global.isDebug = false
  global.env = 'dev-online'
  runSequence 'build', cb
