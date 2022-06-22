module.exports = (sequelize, DataTypes) => {

  const Waiter_users = sequelize.define("waiter_users", {
    user_id: {
      type: DataTypes.INTEGER
    },
    nik: {
      type: DataTypes.INTEGER
    },
    name: {
      type: DataTypes.STRING
    },
    address: {
      type: DataTypes.STRING
    },
    gender: {
      type: DataTypes.INTEGER
    },
    phone_number: {
      type: DataTypes.INTEGER
    },
    description: {
      type: DataTypes.STRING
    },
  })

  return Waiter_users
}
