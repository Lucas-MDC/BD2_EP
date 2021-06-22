const fs = require('fs')
const { Pool, Client } = require('pg');

let express = require("express");
let server  = express();
server.use(express.json());
server.use(express.urlencoded({extended: true}));

//////////////////////////////////////////////////////////////////////////////////////
// Server

//favicon
server.get('/favicon.ico', (req, res) => 
{
    res.type("image/x-icon");
    res.sendFile(__dirname + "/resources/favicon.ico");
});

//pagina
server.get('/', (req, res) => 
{
    res.sendFile(__dirname + "/page.html");
});

//recursos estaticos
server.use('/resources', express.static('resources'));

  
//////////////////////////////////////////////////////////////////////////////////////
// Main

// Conecta
const pool = new Pool
({
  user: 'postgres',
  host: '127.0.0.1',
  database: 'Retails',
  password: '1234567890',
  port: 5432,
});

server.listen(8002);