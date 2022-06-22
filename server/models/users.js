module.exports = (sequelize, DataTypes) => {

  const Users = sequelize.define("users", {
    username: {
      type: DataTypes.STRING
    },
    password: {
      type: DataTypes.STRING
    },
    role: {
      type: DataTypes.INTEGER
    },
  })

  return Users
}
