const express = require('express');

const router = express.Router();

const controllerReportes = require('../controllers/controller_reportes');
const isAuth = require('../controllers/is-auth');

router.get('/', isAuth, controllerReportes.reportes);

router.get('/nuevo', isAuth, controllerReportes.nuevo_reporte);

router.get('/modificar', isAuth, controllerReportes.modificar_reporte);

module.exports = router;