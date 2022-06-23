const express = require('express');
const app = express();
const cors = require('cors');

app.use(express.json());
app.use(cors());

const db = require('./models');

const adminUserRouter = require('./routes/admin_users');
const categoryRouter = require('./routes/categories');
const productRouter = require('./routes/products');
const saleRouter = require('./routes/sales');
const userRouter = require('./routes/users');
const waiterUserRouter = require('./routes/waiter_users');
const wholesaleRouter = require('./routes/wholesales');

app.use('/admin_users', adminUserRouter);
app.use('/categories', categoryRouter);
app.use('/products', productRouter);
app.use('/sales', saleRouter);
app.use('/users', userRouter);
app.use('/waiter_users', waiterUserRouter);
app.use('/wholesales', wholesaleRouter);

db.sequelize.sync().then(() => {
  app.listen(5000, () => {
    console.log('server is running');
  });
});
