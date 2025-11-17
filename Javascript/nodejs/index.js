const express = require('express');
const app = express();
const path = require('path');
const expressWs = require('express-ws')(app);

app.use(express.static(path.join(__dirname, 'public')));

app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'views'));

const homeRoutes = require('./routes/homeRoutes');
app.use('/', homeRoutes);

app.get('/', (req, res, next) => {
    res.send("hallo welt");
})

app.listen(3000, () => {
    console.log("Server läuft auf http://localhost:3000");
});