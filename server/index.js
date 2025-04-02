const express = require("express");
const http = require("http");
const mongoose = require("mongoose");
const Game = require("./models/game.js");
const getSentence = require("./api/getSentence.js");

const app = express();
const port = process.env.PORT || 3000;
var server = http.createServer(app);
var io = require("socket.io")(server);

// middle ware to manipulate data in JSON for incoming requests to the server
app.use(express.json());

// connect mongodb
const DB = "mongodb+srv://tyagigarv95:1436@cluster0.nwuiwp8.mongodb.net/";

// listening to socket.io events from client(flutter code)
io.on("connection", (socket) => {
  socket.on("create-game", async ({ nickname }) => {
    console.log("create-game received with nickname:", nickname);
    try {
      let game = new Game();
      const sentence = await getSentence();
      console.log("Sentence received:", sentence);
      game.words = sentence;

      let player = {
        socketID: socket.id,
        nickname, // shorthand for nickname: nickname
        isPartyLeader: true,
      };
      game.players.push(player);
      const savedGame = await game.save();
      console.log("Game saved successfully:", savedGame);
    } catch (e) {
      console.log("Error in create-game:", e);
    }
  });
});

mongoose
  .connect(DB)
  .then(() => {
    console.log("Connection Successfull!");
  })
  .catch((e) => {
    console.log(e);
  });

// listening to server
server.listen(port, "0.0.0.0", () => {
  console.log(`Server running on port ${port}`);
});
