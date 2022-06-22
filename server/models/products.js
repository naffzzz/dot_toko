module.exports = (sequelize, DataTypes) => {

  const Products = sequelize.define("products", {
    name: {
      type: DataTypes.STRING
    },
    description: {
      type: DataTypes.STRING
    },
    category_id: {
      type: DataTypes.INTEGER
    },
    stock: {
      type: DataTypes.INTEGER
    },
    price: {
      type: DataTypes.INTEGER
    },
    discount: {
      type: DataTypes.INTEGER
    }
  })

  return Products
}
