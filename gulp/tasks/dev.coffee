gulp = require 'gulp'
runSequence = require 'run-sequence'


gulp.task 'dev', ['clean'], (cb)->
  cb = cb || ()->

  global.isDebug = true

  runSequence 'styles', 'images', 'views', 'browserify', 'watch', cb

