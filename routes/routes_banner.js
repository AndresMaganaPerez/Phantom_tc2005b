const express = require('express');

const router = express.Router();

const controllerBanner = require('../controllers/controller_banner');
const isAuth = require('../controllers/is-auth');

router.get('/consultar_banners', isAuth, controllerBanner.banners);

router.post('/eliminar_banner', controllerBanner.eliminarBanner);

router.post('/modificar_banner', controllerBanner.modificarBanner);

router.get('/agregar_banner', isAuth, controllerBanner.vistaAgregarBanner);

router.post('/agregar_banner', controllerBanner.agregarBanner);

module.exports = router;