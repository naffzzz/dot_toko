const express = require('express');
const router = express.Router();
const {categories} = require('../models');
const {validateToken} = require('../middlewares/LoginMiddleware');

router.get('/', async (req, res) => {
  const lists = await categories.findAll();
  res.json(lists);
});

router.get('/show/:id', async (req, res) => {
  const id = req.params.id;
  const Categories = await categories.findByPk(id);
  res.json(Categories);
});

router.post('/', validateToken, async (req, res) => {
  const post = req.body;
  await categories.create(post);
  res.json()
});

router.delete("/:id", validateToken, async (req, res) => {
  const id = req.params.id;

  await categories.destroy({
    where: {
      id: id,
    },
  });

  res.json("Data produk terhapus");
});

module.exports = router;
