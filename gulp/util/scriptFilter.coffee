path=require 'path'

module.exports= (name)->
  /(\.(coffee)$)/i.test path.extname name