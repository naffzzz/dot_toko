const express = require('express');
const router = express.Router();
const {sales} = require('../models');
const {validateToken} = require('../middlewares/LoginMiddleware');

router.get('/', async (req, res) => {
  const lists = await sales.findAll();
  res.json(lists);
});

router.get('/show/:id', async (req, res) => {
  const id = req.params.id;
  const Sales = await sales.findByPk(id);
  res.json(Sales);
});

router.post('/', validateToken, async (req, res) => {
  const post = req.body;
  await sales.create(post);
  res.json()
});

router.put("/update", validateToken, async (req, res) => {
  const { product_id, quantity, price, discount, id } = req.body;
  await sales.update({
    product_id: product_id ,
    quantity: quantity,
    price: price,
    discount: discount
  }, { where: { id: id } });
  res.json("berhasil memperbarui");
});

router.delete("/:id", validateToken, async (req, res) => {
  const id = req.params.id;

  await sales.destroy({
    where: {
      id: id,
    },
  });

  res.json("Data penjualan terhapus");
});

module.exports = router;
