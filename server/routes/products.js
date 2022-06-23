const express = require('express');
const router = express.Router();
const {products} = require('../models');
const {validateToken} = require('../middlewares/LoginMiddleware');

router.get('/', async (req, res) => {
  const lists = await products.findAll();
  res.json(lists);
});

router.get('/show/:id', async (req, res) => {
  const id = req.params.id;
  const Products = await products.findByPk(id);
  res.json(Products);
});

router.post('/', validateToken, async (req, res) => {
  const post = req.body;
  await products.create(post);
  res.json()
});

router.put("/update", validateToken, async (req, res) => {
  const { name, description, category_id, stock, price, discount, id } = req.body;
  await products.update({
    name: name ,
    category_id: category_id,
    description: description,
    stock: stock,
    price: price,
    discount: discount
  }, { where: { id: id } });
  res.json("berhasil memperbarui");
});

router.delete("/:id", validateToken, async (req, res) => {
  const id = req.params.id;

  await products.destroy({
    where: {
      id: id,
    },
  });

  res.json("Data produk terhapus");
});

module.exports = router;
