const express = require('express');

const router = express.Router();

const controllerVacaciones = require('../controllers/controller_vacaciones');
const isAuthAdminRH = require('../controllers/is-authAdminRH');
const isAuthLider = require('../controllers/is-authLider');
const isAuthOperador = require('../controllers/is-authOperador');
const isAuth = require('../controllers/is-auth');

router.get('/solicitar_mis_vacaciones', isAuth, controllerVacaciones.solicitarVacaciones);

router.post('/solicitar_mis_vacaciones', isAuth, controllerVacaciones.postSolicitarVacaciones);

router.get('/solicitudes_estatus_vacaciones', isAuth, controllerVacaciones.estatusVacaciones);

router.get('/estatus_mis_vacaciones', isAuth, controllerVacaciones.estatusMisVacaciones);

router.get('/solicitudes_vacaciones', isAuth, controllerVacaciones.solicitudesVacacionesSinEstatus);

module.exports = router;