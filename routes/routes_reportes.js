const express = require('express');

const router = express.Router();

const controllerReportes = require('../controllers/controller_reportes');
const isAuthAdminRH = require('../controllers/is-authAdminRH');
const isAuthLider = require('../controllers/is-authLider');
const isAuthOperador = require('../controllers/is-authOperador');
const isAuth = require('../controllers/is-auth');

router.get('/', isAuth, controllerReportes.reportes);

router.get('/nuevo', isAuth, controllerReportes.nuevo_reporte);

router.post('/nuevo', isAuth, controllerReportes.post_nuevo_reporte);

router.get('/modificar/:idIndicador', isAuth, controllerReportes.modificar_reporte);

router.post('/modificar', isAuth, controllerReportes.post_modificar_reporte);

module.exports = router;