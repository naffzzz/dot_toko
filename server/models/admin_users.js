module.exports = (sequelize, DataTypes) => {

  const Admin_users = sequelize.define("admin_users", {
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
    }
  })

  return Admin_users
}
