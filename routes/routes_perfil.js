const express = require('express');

const router = express.Router();

const controllerPerfil = require('../controllers/controller_perfil');
const isAuthAdminRH = require('../controllers/is-authAdminRH');
const isAuthLider = require('../controllers/is-authLider');
const isAuthOperador = require('../controllers/is-authOperador');
const isAuth = require('../controllers/is-auth');

router.get('/', isAuth, controllerPerfil.perfil);

module.exports = router;