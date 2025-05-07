const express = require('express');
const app = express();
const port = 3000;

app.get('/board/page/:page', (req, res) => {
    const parameter = req.params.page;
    res.send(`This is page #${parameter}`);
})



app.listen(port, () => console.log("Listening"));