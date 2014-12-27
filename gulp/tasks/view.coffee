config = require '../config'
gulp = require 'gulp'
templateCache = require 'gulp-angular-templatecache'

gulp.task 'views', ->
  gulp.src 'app/index.html'
  .pipe gulp.dest config.dist.root

  gulp.src config.views.src
  .pipe templateCache
    standalone: true
  .pipe gulp.dest config.views.dest