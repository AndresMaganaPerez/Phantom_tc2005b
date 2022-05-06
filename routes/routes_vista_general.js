const express = require('express');

const router = express.Router();

const controllerVistaGeneral = require('../controllers/controller_vista_general');
const isAuth = require('../controllers/is-auth');

router.get('/', isAuth, controllerVistaGeneral.vistaGeneral);

module.exports = router;