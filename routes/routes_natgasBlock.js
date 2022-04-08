const express = require('express');

const router = express.Router();

const controllerNGB = require('../controllers/controller_natgasBlock');
const isAuth = require('../controllers/is-auth');

router.get('/solicitar_mi_natgas_block', isAuth, controllerNGB.solicitarNatgasBlock);

router.get('/solicitudes_natgas_block', isAuth, controllerNGB.solicitudesNatgasBlock);

module.exports = router;