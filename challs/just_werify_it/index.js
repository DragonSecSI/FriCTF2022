const express = require("express");
require("dotenv").config();
const app = express();
const port = 3000;
const currNum = Math.floor(Math.random() * 100000000000000000);

function authWithJWT(req, res, next) {
  try {
    const authorization = req.get("Authorization");
    const b64data = authorization.split(" ")[1];
    const b64header = b64data.split(".")[0];
    const b64payload = b64data.split(".")[1];
    const hbuff = Buffer.from(b64header, "base64");
    const header = JSON.parse(hbuff.toString("utf-8"));
    const pbuff = Buffer.from(b64payload, "base64");
    const payload = JSON.parse(pbuff.toString("utf-8"));
    if (
      header["alg"] === "HS256" &&
      header["typ"] === "JWT" &&
      payload["name"] === "admin" &&
      payload["pwd"] === process.env.PASSWORD
    ) {
      next();
    } else {
      res.sendFile("success.html", { root: "." });
    }
  } catch (error) {
    res.sendFile("success.html", { root: "." });
  }
}

//all files are on github anyways
app.use(
  "/files",
  express.static("./", {
    dotfiles: "allow",
  })
);

app.get("/", function (req, res) {
  // Print banner for this new file server
  return res.sendFile("homepage.html", { root: "." });
});

app.get("/admin", authWithJWT, function (req, res) {
  return res.send("The flag is at /flag/" + currNum.toString());
});

app.get("/flag/:id", authWithJWT, function (req, res) {
  return res.send(
    req.params.id === currNum.toString()
      ? process.env.FLAG
      : "This is not what you are looking for... ✋"
  );
});

app.listen(port, function () {
  console.log(`Listening on port ${port}!`);
});
