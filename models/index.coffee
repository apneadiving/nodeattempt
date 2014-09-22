fs        = require 'fs'
path      = require 'path'
Sequelize = require 'sequelize'
lodash    = require 'lodash'
settings  = require('../config').settings

sequelize = new Sequelize(settings.database, settings.username, settings.password,
  dialect: settings.dialect
)

db = {}

fs
  .readdirSync(__dirname)
  .filter (file)->
    (file.indexOf('.') != 0) && (file != 'index.coffee')

  .forEach (file)->
    model = sequelize.import(path.join(__dirname, file))
    db[model.name] = model

Object.keys(db).forEach (modelName)->
  if 'associate' in db[modelName]
    db[modelName].associate(db)

module.exports = lodash.extend
  sequelize: sequelize
  Sequelize: Sequelize
, db
