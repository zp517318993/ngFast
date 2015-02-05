os = require 'os'

requireDir = require 'require-dir'

global.isProd = false
global.env = 'dev'

if process.env.NODE_ENV == 'production'
  global.autoTagVersion = false

#global.ip = os.networkInterfaces().en0[1].address

requireDir './gulp/tasks',
  recurse: true
