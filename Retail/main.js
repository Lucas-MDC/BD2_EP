const fs = require('fs')
const { Pool, Client } = require('pg');
const crypto = require('crypto');


let express = require("express");
let app  = express();
app.use(express.json());
app.use(express.urlencoded({extended: true}));
app.use(express.static('imgs'));

//////////////////////////////////////////////////////////////////////////////////////
// Banco

//Normaliza
function normalizeResult(res)
{
    let set = {};
    set.columns = [];
    set.rows = res.rows;
    set.typeIDs  = [];

    for(let i = 0; i < res.fields.length; i++)
    {
        set.columns[i] = res.fields[i].name;
        set.typeIDs[i] = res.fields[i].dataTypeID;
    }

    return set;
}

const qproc  = fs.readFileSync("./queries/qproc.sql").toString();
const qvideo = fs.readFileSync("./queries/qvideo.sql").toString();
const qpmae  = fs.readFileSync("./queries/qpmae.sql").toString();
const qmems  = fs.readFileSync("./queries/qmems.sql").toString();
const qmemp  = fs.readFileSync("./queries/qmemp.sql").toString();
const qmaq   = fs.readFileSync("./queries/qmaq.sql").toString();
const auth   = fs.readFileSync("./queries/auth.sql").toString();
const qbuy   = fs.readFileSync("./queries/buy.sql").toString();
 
//////////////////////////////////////////////////////////////////////////////////////
// app

//favicon
app.get('/favicon.ico', (req, res) => 
{
    res.type("image/x-icon");
    res.sendFile(__dirname + "/resources/favicon.ico");
});

//pagina
app.get('/', (req, res) => 
{
    res.sendFile(__dirname + "/page.html");
});

//recursos estaticos
app.use('/resources', express.static('resources'));

//buy
app.post('/buy', (req, res) => 
{
    if(req.body.name == null || req.body.pass == null)
    {
      res.send(false);
      res.end();
      return;
    }

    user_name  = req.body.name.replace(";", "");
    user_pass  = req.body.pass.replace(";", "");
    hash       = crypto.createHash('md5').update(user_pass).digest('hex');
    query      = auth.replace("nome;", user_name).replace("hash;", hash);
    product_id = (req.body.pid + "").replace(";", "");

    pool.query(query, (err, set) => 
    {  

        set = normalizeResult(set);      
        if(set.rows == null || set.rows.length == 0)
          res.send(false);
        else
        {
          user_id = set.rows[0]["id_cliente"];
          buyquery = qbuy.replace(";clid", user_id).replace(";pid", product_id).replace(";pid", product_id);
          pool.query(buyquery, (err2, set2) => 
          {     
              res.send(true)
              res.end();
          });
        }
    });
});

//auth
app.post('/auth', (req, res) => 
{
    if(req.body.name == null || req.body.pass == null)
    {
      res.send(false);
      res.end();
      return;
    }

    let user_name = req.body.name.replace(";", "");
    let user_pass = req.body.pass.replace(";", "");
    let hash      = crypto.createHash('md5').update(user_pass).digest('hex');

    let query = auth.replace("nome;", user_name).replace("hash;", hash);

    pool.query(query, (err, set) => 
    {  
        set = normalizeResult(set);      
        if(set.rows == null || set.rows.length == 0)
          res.send(false);
        else
          res.send(true);
        res.end();
    });
});

//Queries
app.get('/qproc', (req, res) => 
{
    pool.query(qproc, (err, set) => 
    {
        set = normalizeResult(set);      
        res.send(set);
        res.end();
    });
});

app.get('/qvideo', (req, res) => 
{
    pool.query(qvideo, (err, set) => 
    {
        set = normalizeResult(set);      
        res.send(set);
        res.end();
    });
});

app.get('/qmaq', (req, res) => 
{
    pool.query(qmaq, (err, set) => 
    {
        set = normalizeResult(set);      
        res.send(set);
        res.end();
    });
});

app.get('/qmemp', (req, res) => 
{
    pool.query(qmemp, (err, set) => 
    {
        set = normalizeResult(set);      
        res.send(set);
        res.end();
    });
});

app.get('/qmems', (req, res) => 
{
    pool.query(qmems, (err, set) => 
    {
        set = normalizeResult(set);      
        res.send(set);
        res.end();
    });
});

app.get('/qpmae', (req, res) => 
{
    pool.query(qpmae, (err, set) => 
    {
        set = normalizeResult(set);      
        res.send(set);
        res.end();
    });
});

//////////////////////////////////////////////////////////////////////////////////////
// Main

// Conecta
const pool = new Pool
({
  user: 'postgres',
  host: '127.0.0.1',
  database: 'Retail',
  password: '1234567890',
  port: 5432,
});

app.listen(8002);

