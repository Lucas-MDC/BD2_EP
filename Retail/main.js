const fs = require('fs')
const { Pool, Client } = require('pg');

let express = require("express");
let server  = express();
server.use(express.json());
server.use(express.urlencoded({extended: true}));

  
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