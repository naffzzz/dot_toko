module.exports = (sequelize, DataTypes) => {

  const Sales = sequelize.define("sales", {
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

  return Sales
}
