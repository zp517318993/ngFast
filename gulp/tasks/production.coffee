gulp = require 'gulp'
runSequence = require 'run-sequence'

gulp.task 'prod', (cb)->
  global.isDebug = false
  global.env = 'production'
  runSequence 'build', cb
