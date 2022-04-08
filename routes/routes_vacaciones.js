const express = require('express');

const router = express.Router();

const controllerVacaciones = require('../controllers/controller_vacaciones');
const isAuth = require('../controllers/is-auth');

router.get('/solicitar_mis_vacaciones', isAuth, controllerVacaciones.solicitarVacaciones);

router.get('/solicitudes_vacaciones', isAuth, controllerVacaciones.solicitudesVacaciones);

router.post('/solicitudes_mis_vacaciones', isAuth, controllerVacaciones.postSolicitarVacaciones);

module.exports = router;