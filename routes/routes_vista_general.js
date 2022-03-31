const express = require('express');

const router = express.Router();

const controllerVistaGeneral = require('../controllers/controller_vista_general');

router.get('/general', controllerVistaGeneral.vistaGeneral);

module.exports = router;