const express = require('express');
const router = express.Router();
const {waiter_users} = require('../models');
const {validateToken} = require('../middlewares/LoginMiddleware');

router.get('/', async (req, res) => {
  const lists = await waiter_users.findAll();
  res.json(lists);
});

router.get('/show/:id', async (req, res) => {
  const id = req.params.id;
  const waiter_user = await waiter_users.findByPk(id);
  res.json(admin_user);
});

router.post('/', validateToken, async (req, res) => {
  const post = req.body;
  await waiter_users.create(post);
  res.json()
});

router.delete("/:id", validateToken, async (req, res) => {
  const id = req.params.id;

  await waiter_users.destroy({
    where: {
      id: id,
    },
  });

  res.json("Data pegawai terhapus");
});

module.exports = router;
