os = require 'os'

requireDir = require 'require-dir'
getIp = require 'dev-ip'

global.isProd = false
global.env = 'dev'

if process.env.NODE_ENV == 'production'
  global.autoTagVersion = false

global.ip = getIp()[0]

requireDir './gulp/tasks',
  recurse: true
