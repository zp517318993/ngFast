os = require 'os'

requireDir = require 'require-dir'

global.isProd = false
global.buildTime = Date.now().toString()
global.env = 'dev'

global.ip = os.networkInterfaces().en0[1].address

requireDir './gulp/tasks',
  recurse: true
