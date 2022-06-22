const express = require('express');
const app = express();
const cors = require('cors');

app.use(express.json());
app.use(cors());

const db = require('./models');

const userRouter = require('./routes/users');
const productRouter = require('./routes/products');
app.use('/users', userRouter);
app.use('/products', productRouter);

db.sequelize.sync().then(() => {
  app.listen(5000, () => {
    console.log('server is running');
  });
});
