require('coffee-script/register');

var app, port, db;

app  = require('./src/main');
db   = require('./models');
port = app.port;

global.db = db;

global.debug = function(foo, bar, baz){
  debugger;
}

db
  .sequelize
  .sync()
  .complete(function(err) {
    if (err) {
      throw err[0]
    } else {
      app.listen(port, function() {
        return console.log("Listening on " + port + "\nPress CTRL-C to stop server.");
      });
    }
  })
