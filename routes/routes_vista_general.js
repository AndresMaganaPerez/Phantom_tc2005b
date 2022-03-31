const express = require('express');

const router = express.Router();

const controllerVistaGeneral = require('../controllers/controller_vista_general');

router.get('/general', controllerVistaGeneral.vistaGeneral);

router.get('/perfil',controllerVistaGeneral.perfil);

module.exports = router;