const express = require('express');
const app = express();
const cors = require('cors');

app.use(express.json());
app.use(cors());

const db = require('./models');

const adminUserRouter = require('./routes/admin_users');
const categoryRouter = require('./routes/categories');
const productRouter = require('./routes/products');
const userRouter = require('./routes/users');
const waiterUserRouter = require('./routes/waiter_users');

app.use('/admin_users', adminUserRouter);
app.use('/categories', categoryRouter);
app.use('/products', productRouter);
app.use('/users', userRouter);
app.use('/waiter_users', waiterUserRouter);

db.sequelize.sync().then(() => {
  app.listen(5000, () => {
    console.log('server is running');
  });
});
