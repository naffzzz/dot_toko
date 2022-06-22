const express = require('express');
const router = express.Router();
const {users} = require('../models');
const bcrypt = require('bcrypt');
const {validateToken} = require('../middlewares/LoginMiddleware');

const {sign} = require('jsonwebtoken');

router.get('/', async (req, res) => {
  const user = await users.findAll();
  res.json(user);
});

router.post('/add', validateToken, async (req, res) => {
  const { username, password, role } = req.body;
  bcrypt.hash(password, 10).then((hash)=>{
    users.create({
      username: username,
      password: hash,
      role: role
    })
    res.json("berhasil menambah user");
  });
});

router.post('/login', async (req, res) => {
  const {username, password} = req.body;
  const user = await users.findOne({ where: { username: username } });

  if (!user) res.json({ error: "Akun Tidak diketemukan" });

  bcrypt.compare(password, user.password).then(async (match) => {
    if (!match) res.json({ error: "Username atau password salah" });

    const accessToken = sign(
      { username: user.username, id: user.id },
      "importancesecret"
    );
    res.json({"accessToken": accessToken, "role": user.role, "username": user.username, "id": user.id});
  });
});

router.delete("/:id", validateToken, async (req, res) => {
  const id = req.params.id;

  await users.destroy({
    where: {
      id: id,
    },
  });

  res.json("Data produk terhapus");
});

router.get('/auth', validateToken, (req, res) => {
  res.json(req.user);
});

module.exports = router;
