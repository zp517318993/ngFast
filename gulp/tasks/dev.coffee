gulp = require 'gulp'
runSequence = require 'run-sequence'

gulp.task 'dev', ['clean'], (cb)->
  cb = cb || ()->

  global.isProd = false

  runSequence 'styles', 'images', 'views', 'browserify', 'watch', cb