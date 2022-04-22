const express = require('express');

const router = express.Router();

const controllerBanner = require('../controllers/controller_banner');
const isAuthAdminRH = require('../controllers/is-authAdminRH');
const isAuthLider = require('../controllers/is-authLider');
const isAuthOperador = require('../controllers/is-authOperador');
const isAuth = require('../controllers/is-auth');

router.get('/consultar_banners', isAuth, controllerBanner.banners);

router.get('/agregar_banner', isAuth, controllerBanner.vistaAgregarBanner);

router.post('/agregar_banner', controllerBanner.agregarBanner);

module.exports = router;