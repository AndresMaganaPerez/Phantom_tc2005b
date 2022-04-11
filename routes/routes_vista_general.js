const express = require('express');

const router = express.Router();

const controllerVistaGeneral = require('../controllers/controller_vista_general');
const isAuthAdminRH = require('../controllers/is-authAdminRH');
const isAuthLider = require('../controllers/is-authLider');
const isAuthOperador = require('../controllers/is-authOperador');
const isAuth = require('../controllers/is-auth');

router.get('/', isAuth, controllerVistaGeneral.vistaGeneral);

module.exports = router;