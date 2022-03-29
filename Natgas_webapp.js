const express = require('express');
const app = express();
const path = require('path');
const cookieParser = require('cookie-parser');
const session = require('express-session');

//const csrf = require('csurf');
//const csrfProtection = csrf();

const bodyParser = require('body-parser');
app.use(bodyParser.urlencoded({extended: false}));
app.use(bodyParser.json());
//app.use(cookieParser());

app.use(express.static(path.join(__dirname, 'public')));

app.set('view engine', 'ejs');
app.set('views', 'views');

//Control de sesiones
/*
app.use(session({
    secret: 'asñldfjlñaksdjfoñksdajrioweuroiudasofhjasñofhjoeiwahfjadshfuñoewhafoñheadwfhñdsaohfoaewjhrñoaksdjfouegbñgjibnñvijnachasdñil', 
    resave: false, //La sesión no se guardará en cada petición, sino sólo se guardará si algo cambió 
    saveUninitialized: false, //Asegura que no se guarde una sesión para una petición que no lo necesita
}));
*/

//Proteccion csrf
/*
app.use(csrfProtection); 
app.use((request, response, next) => {
    response.locals.csrfToken = request.csrfToken();
    next();
}); 
*/

//Middlewares
app.use((request, response, next) => {
    next();
});

app.use((request, response, next) => {
    console.log('Ruta no existe');
    response.statusCode = 404;
    response.send('<h1>La ruta que buscas no existe</h1>');
});

app.listen(1500);