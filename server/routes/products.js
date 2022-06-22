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

module.exports = router;
