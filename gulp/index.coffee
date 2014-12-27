fs = require 'fs'
gulp = require 'gulp'
onlyScripts = require './util/scriptFilter'
tasks = fs.readdirSync './gulp/tasks/'
.filter onlyScripts


tasks.forEach (task)->
  require('./tasks/' + task)
