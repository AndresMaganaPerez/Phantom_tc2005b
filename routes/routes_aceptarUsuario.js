const express = require('express');

const router = express.Router();

const controllerAnuncios = require('../controllers/controller_aceptarRegistro');
const isAuth = require('../controllers/is-auth');

router.get('/', isAuth, controller_aceptarRegistro.Registro);

module.exports = router;