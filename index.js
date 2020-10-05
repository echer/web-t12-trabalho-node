const express = require('express')
const http = require("http") 
const consign = require("consign")
const jwt = require("jsonwebtoken");
const cors = require('cors')

require('dotenv').config();

const app = express();
const server = http.Server(app)

app.use(cors({ origin: 'http://localhost:8080', credentials: true }))

app.set('jwt', jwt)

app.use(express.json());
app.use(express.urlencoded({ extended: false }))

consign({ cwd: 'src' })
    .include("db")
    .then("utils")
    .then("middlewares")
    .then("models")
    .then("controllers")
    .then("routes")
    .into(app)

server.listen(8000, function() { // modificar
    console.log("Servidor rodando na porta 8000");
})