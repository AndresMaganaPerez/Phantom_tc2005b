const express = require('express');
const app = express();
const path = require('path');
const session = require('express-session');

//const csrf = require('csurf');
//const csrfProtection = csrf();

const bodyParser = require('body-parser');
app.use(bodyParser.urlencoded({extended: false}));
app.use(bodyParser.json());
const cookieParser = require('cookie-parser');
const multer = require('multer');

const fileStorage = multer.diskStorage({
    destination: (request, file, callback) => {
        callback(null, 'uploads');
    },
    filename: (request, file, callback) => {
        callback(null, new Date().getTime() + '-' + file.originalname);
    },
});

app.use(multer({ storage: fileStorage }).single('image')); 

app.use(express.static(path.join(__dirname, 'public')));
app.use(express.static(path.join(__dirname, 'uploads')));

app.set('view engine', 'ejs');
app.set('views', 'views');

//Importar las rutas
const rutasConsultaUsuarios = require('./routes/routes_consultaUsuarios')
const rutasVistaGeneral = require('./routes/routes_vista_general');
const rutasPerfil = require('./routes/routes_perfil');
const rutasVacaciones = require('./routes/routes_vacaciones');
const rutasNGB = require ('./routes/routes_natgasBlock');
const rutasReportes = require('./routes/routes_reportes');
const rutasAnuncios = require('./routes/routes_anuncios');
const rutasBanners = require('./routes/routes_banner');
const rutasLogin = require('./routes/routes_login');
const rutasEmpleados = require('./routes/routes_Empleados')
const { request } = require('http');
const { response } = require('express');




app.use(session({
    secret: 'asñldfjlñaksdjfoñksdajrioweuroiudasofhjasñofhjoeiwahfjadshfuñoewhafoñheadwfhñdsaohfoaewjhrñoaksdjfouegbñgjibnñvijnachasdñil', 
    resave: false, //La sesión no se guardará en cada petición, sino sólo se guardará si algo cambió 
    saveUninitialized: false, //Asegura que no se guarde una sesión para una petición que no lo necesita
}));


//Proteccion csrf
/*
app.use(csrfProtection); 
app.use((request, response, next) => {
    response.locals.csrfToken = request.csrfToken();
    next();
}); 
*/

//app.use de las rutas
app.use(cookieParser());
app.use('/general', rutasVistaGeneral);
app.use('/perfil', rutasPerfil);
app.use('/vacaciones', rutasVacaciones);
app.use('/natgas_blocks', rutasNGB);
app.use('/reportes', rutasReportes);
app.use('/anuncios', rutasAnuncios);
app.use('/banners', rutasBanners);
app.use('/usuarios',rutasConsultaUsuarios);
app.use('/', rutasLogin);
app.use('/empleados', rutasEmpleados);

//Middlewares
app.use((request, response, next) => {
    next();
});

app.use((request, response, next) => {
    console.log('Ruta no existe');
    response.statusCode = 404;
    response.send('<h1>La ruta que buscas no existe</h1>');
});

app.listen(5000);