const express = require('express');

const router = express.Router();

const controllerNGB = require('../controllers/controller_natgasBlock');
const isAuthAdminRH = require('../controllers/is-authAdminRH');
const isAuthLider = require('../controllers/is-authLider');
const isAuthOperador = require('../controllers/is-authOperador');
const isAuth = require('../controllers/is-auth');

router.get('/solicitar_mi_natgas_block', isAuth, controllerNGB.solicitarNatgasBlock);

router.post('/solicitar_mi_natgas_block', isAuth, controllerNGB.postDeSolicitud)

router.get('/solicitudes_natgas_block', isAuth, controllerNGB.solicitudesAceptarNatgasBlock);

router.get('/solicitudes_estatus_natgas_block', isAuth, controllerNGB.solicitudesEstatusNatgasBlock);

module.exports = router;