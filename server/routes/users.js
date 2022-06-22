const express = require('express');
const router = express.Router();
const {users} = require('../models');
const bcrypt = require('bcrypt');

const {sign} = require('jsonwebtoken');

router.get('/', async (req, res) => {
  const user = await users.findAll();
  res.json(user);
});

router.post('/add', async (req, res) => {
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
  const user = await users.findOne({ where: {username:username} });

  if (!user) {
    res.json({error: "User tidak ditemukan"});
  }else {
    bcrypt.compare(password, user.password).then((match) => {
      if (!match) res.json({error: "username atau password salah"});

      const accessToken = sign({username: user.username, id: user.id},
        "importancesecret"
      );
      res.json(accessToken);
    });
  }
})

module.exports = router;
