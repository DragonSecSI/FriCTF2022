const express = require("express");
require("dotenv").config();
const app = express();
const port = 8000;
const flag = process.env.FLAG || "#REDACTED#";

// set the view engine to ejs
app.set("view engine", "ejs");

const sourceMiddleware = (req, res, next) => {
  // If someone makes a request through proxy, we can get the source of the request from the request headers
  // Read more here: https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/X-Forwarded-For
  const ipAddress = req.header("x-forwarded-for") || req.socket.remoteAddress;
  req.ipAddress = ipAddress.toString();
  next();
};

app.use(sourceMiddleware);

app.get("/", (req, res) => {
  const isAdmin =
    req.ipAddress.includes("localhost") || req.ipAddress.includes("127.0.0.1");
  console.log(req.ipAddress);
  return res.render("index", {
    ipAddress: req.ipAddress,
    isAdmin,
    secret: flag,
  });
});

app.listen(port, () => console.log(`Example app listening on port ${port}!`));
