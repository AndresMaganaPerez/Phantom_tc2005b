const express = require('express');

const router = express.Router();

const controllerAnuncios = require('../controllers/controller_aceptarRegistro');
const isAuth = require('../controllers/is-auth');

router.get('/', isAuth, controller_aceptarRegistro.Registro);

router.get('/aceptar_registro', isAuth, controller_aceptarUsuario.aceptarUsuario);

module.exports = router;