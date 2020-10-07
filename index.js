const express = require('express')
const http = require("http") 
const consign = require("consign")
const jwt = require("jsonwebtoken");
const cors = require('cors')
const PORT = process.env.PORT || 5000
const path = require('path')

require('dotenv').config();

const app = express();
const server = http.Server(app)

app.use(cors({ origin: 'https://alan-echer-webt12-trabalho.herokuapp.com', credentials: true }))

app.set('jwt', jwt)

app.use(express.json());
app.use(express.urlencoded({ extended: false }))
app.use(express.static(path.join(__dirname, 'public')))
app.set('views', path.join(__dirname, 'views'))
app.set('view engine', 'ejs')

consign({ cwd: 'src' })
    .include("db")
    .then("utils")
    .then("middlewares")
    .then("models")
    .then("controllers")
    .then("routes")
    .into(app)

server
    .listen(PORT, function() { // modificar
        console.log("Servidor rodando na porta ${PORT}");
})