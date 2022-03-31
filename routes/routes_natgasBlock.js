const express = require('express');

const router = express.Router();

const controllerNGB = require('../controllers/controller_natgasBlock');

router.get('/solicitar_mi_natgas_block', controllerNGB.solicitarNatgasBlock);

router.get('/solicitudes_natgas_block', controllerNGB.solicitudesNatgasBlock);

module.exports = router;