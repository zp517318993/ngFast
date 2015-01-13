process.env.NODE_ENV ?= 'dev'

module.exports =

  serverPort: 3054

  styles:
    src: 'app/styles/**/*.scss'
    dest: 'build/' + process.env.NODE_ENV + '/css'

  scripts:
    src: 'app/coffee/**/*.coffee'
    dest: 'build/' + process.env.NODE_ENV + '/js'

  coffee:
    src: ['app/coffee/**/*.coffee', 'test/**/*.coffee']
    dest: '.temp'

  views:
    watch: [
      'app/index.html'
      'app/views/**/*.html'
    ]
    src: 'app/views/**/*.html'
    dest: 'app/coffee/templates'

  images:
    src: 'app/images/**/*'
    dest: 'build/' + process.env.NODE_ENV + '/images'

  dist:
    root: 'build/' + process.env.NODE_ENV

  browserify:
    entries: ['./app/coffee/app.coffee']
    bundleName: 'app.js'

  test:
    karma: 'test/karma.conf.coffee'
    protractor: 'test/protractor.conf.coffee'

