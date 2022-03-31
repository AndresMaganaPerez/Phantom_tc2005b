const express = require('express');

const router = express.Router();

const controllerVacaciones = require('../controllers/controller_vacaciones');

router.get('/solicitar_mis_vacaciones', controllerVacaciones.solicitarVacaciones);

router.get('/solicitudes_vacaciones', controllerVacaciones.solicitudesVacaciones);

module.exports = router;