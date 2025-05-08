const express = require('express');
const cors = require('cors');
const connection = require('./db_config.js');
const app = express();
 
app.use(cors());
 
const port = 3000;
 
app.get('/api/hello', (req, res) => {
    res.json({message: 'Olá Mundo!'});
});

app.listen(port, () => console.log(`Servidor rodando na porta ${port}`));