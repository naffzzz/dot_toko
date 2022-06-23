const express = require('express');
const router = express.Router();
const {wholesales} = require('../models');
const {validateToken} = require('../middlewares/LoginMiddleware');

router.get('/', async (req, res) => {
  const lists = await wholesales.findAll();
  res.json(lists);
});

router.get('/show/:id', async (req, res) => {
  const id = req.params.id;
  const Wholesales = await wholesales.findByPk(id);
  res.json(Wholesales);
});

router.post('/', validateToken, async (req, res) => {
  const post = req.body;
  await wholesales.create(post);
  res.json("berhasil menambah kulakan");
});

router.delete("/:id", validateToken, async (req, res) => {
  const id = req.params.id;

  await wholesales.destroy({
    where: {
      id: id,
    },
  });

  res.json("Data kulakan terhapus");
});

module.exports = router;
