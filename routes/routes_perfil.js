const express = require('express');

const router = express.Router();

const controllerPerfil = require('../controllers/controller_perfil');
const isAuth = require('../controllers/is-auth');

router.get('/', isAuth, controllerPerfil.perfil);

router.post('/guardarNumeroTelefono', isAuth, controllerPerfil.guardarNumTelefono);

module.exports = router;