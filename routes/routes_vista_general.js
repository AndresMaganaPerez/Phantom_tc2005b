const express = require('express');

const router = express.Router();

const controllerVistaGeneral = require('../controllers/controller_vista_general');

router.get('/', controllerVistaGeneral.vistaGeneral);

module.exports = router;