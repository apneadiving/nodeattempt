//http://sequelizejs.com/docs/1.7.8/migrations
module.exports = {
  up: function(migration, DataTypes, done) {
    // add altering commands here, calling 'done' when finished

    migration.createTable(
      'Users',
      {
        id: {
          type: DataTypes.INTEGER,
          primaryKey: true,
          autoIncrement: true
        },
        firstName: DataTypes.STRING,
        lastName: DataTypes.STRING,
        email: DataTypes.STRING,
        encryptedPassword: DataTypes.STRING,
        uuid: {
          type: DataTypes.STRING,
          allowNull: false
        },
        signinCount: {
          type: DataTypes.INTEGER,
          defaultValue: 0,
          allowNull: false
        },
        createdAt: {
          type: DataTypes.DATE
        },
        updatedAt: {
          type: DataTypes.DATE
        }
      }
    )
    done()
  },
  down: function(migration, DataTypes, done) {
    migration.dropTable('users')
    done()
  }
}
