_    = require 'lodash'
json = require('./config.json')
settings = {}

exports.set = (env)->
  if _.has(json, env)
    _.assign settings, json[env]
  else
    throw "Env #{ env } not found"

exports.settings = settings
