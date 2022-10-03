// require dotenv (npm i dotenv) so we can use .env file
require('dotenv').config()

// use all neccessary libraries
const express = require('express');

// create an express application
const app = express();

// express middleware that only parses json
app.use(express.json());
app.use(
    express.urlencoded({
      extended: true,
    })
  );

// define the port and local ip address that is going to be used
const port = 5000;
const ipAddress = process.env.IPADDRESS;

// user defined routers
const pizzaRouter = require('./routes/pizza');
const categoryRouter = require('./routes/pizza-category');

// default route
app.get('/', (req, res) => {
    res.json({ message: 'ok' });
  });

// use the routes that are defined in the routers
app.use('/pizza', pizzaRouter);
app.use('/category', categoryRouter);

/* Error handler middleware */
app.use((err, req, res, next) => {
  const statusCode = err.statusCode || 500;
  console.error(err.message, err.stack);
  res.status(statusCode).json({ message: err.message });
  return;
});


// listen to the port, using ip address
app.listen(port, ipAddress, () => {
  console.log(`Example app listening at port: ${port}`);
});