const express = require('express');

const router = express.Router();

const controllerUsuario = require('../controllers/controller_aceptarRegistroUsuario');
const isAuth = require('../controllers/is-auth');

router.get('/', isAuth, controller_aceptarRegistro.registro);


module.exports = router;