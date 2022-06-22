const express = require('express');
const router = express.Router();
const {admin_users} = require('../models');
const {validateToken} = require('../middlewares/LoginMiddleware');

router.get('/', async (req, res) => {
  const lists = await admin_users.findAll();
  res.json(lists);
});

router.get('/show/:id', async (req, res) => {
  const id = req.params.id;
  const admin_user = await admin_users.findByPk(id);
  res.json(admin_user);
});

router.post('/', validateToken, async (req, res) => {
  const post = req.body;
  await admin_users.create(post);
  res.json()
});

router.delete("/:id", validateToken, async (req, res) => {
  const id = req.params.id;

  await admin_users.destroy({
    where: {
      id: id,
    },
  });

  res.json("Data admin terhapus");
});

module.exports = router;
