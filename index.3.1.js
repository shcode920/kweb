const express = require('express');
const app = express();
const port = 3000;

app.use(express.urlencoded({ extended: true }));


app.get('/', (req, res) => {
    const obj = req.query;
    const output = Object.keys(obj).map(k => `${k}: ${obj[k]}`).join('\n');
    console.log(output);
    res.type('text').send(output || 'No query data');
});

app.post('/', (req, res) => {
    const obj = req.body;
    const output = Object.keys(obj).map(k => `${k}: ${obj[k]}`).join('\n');
    console.log(output);
    res.type('text').send(output || 'No body data');
});
app.put('/', (req, res) => {
    const obj = req.body;
    const output = Object.keys(obj).map(k => `${k}: ${obj[k]}`).join('\n');
    console.log(output);
    res.type('text').send(output || 'No body data');
});
app.delete('/', (req, res) => {
    const obj = req.body;
    const output = Object.keys(obj).map(k => `${k}: ${obj[k]}`).join('\n');
    console.log(output);
    res.type('text').send(output || 'No body data');
});

app.listen(port, () => console.log("Listening"));
