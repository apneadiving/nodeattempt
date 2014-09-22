express = require 'express'
assets  = require 'connect-assets'
bodyParser = require 'body-parser'

app = express()

app.port = process.env.PORT or 5000
env = process.env.NODE_ENV or 'development'

config = require('../config').set(env)

app.use assets()

app.use express.static(process.cwd() + '/public')

app.set 'view engine', 'jade'

app.use bodyParser.urlencoded({ extended: true })
app.use bodyParser.json()

app.get '/', (req, res)->
  db.User.findAll().success (users)->
    res.json { ok: true }

# routes = require './routes'
# routes(app)

module.exports = app
