module.exports =

  serverPort: 3054

  styles:
    src: 'app/styles/**/*.scss'
    dest: 'build/css'

  scripts:
    src: 'app/coffee/**/*.coffee'
    dest: 'build/js'

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
    dest: 'build/images'

  dist:
    root: 'build'

  browserify:
    entries: ['./app/coffee/app.coffee']
    bundleName: 'app.js'

  test:
    karma: 'test/karma.conf.coffee'
    protractor: 'test/protractor.conf.coffee'

