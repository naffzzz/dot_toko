module.exports = (sequelize, DataTypes) => {

  const Wholesales = sequelize.define("wholesales", {
    product_id: {
      type: DataTypes.INTEGER
    },
    quantity: {
      type: DataTypes.INTEGER
    },
    price: {
      type: DataTypes.INTEGER
    },
    discount: {
      type: DataTypes.INTEGER
    }
  })

  return Wholesales
}
