const express = require('express');
const app = express();
const port = 3000;

const factorial = n => {
    if (n <= 1) return 1;
    else return n * factorial(n-1);
}

app.get('/factorial', (req, res) => {
    const {number} = req.query;
    res.redirect(`/factorial/${number}`);
})

app.get('/factorial/:number', (req, res) => {
    const value = factorial(parseInt(req.params.number, 10));
    res.send(value);
})


app.listen(port, () => console.log("Listening!"));