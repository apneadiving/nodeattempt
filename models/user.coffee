module.exports = (sequelize, DataTypes)->
  User = sequelize.define 'User',
    firstName: DataTypes.STRING
    lastName:  DataTypes.STRING
    email:     DataTypes.STRING
    encryptedPassword: DataTypes.STRING
    uuid:
      type: DataTypes.STRING
      allowNull: false
    signinCount:
      type: DataTypes.INTEGER
      defaultValue: 0
      allowNull: false

  User

