const express = require('express');

const router = express.Router();

const controllerBanner = require('../controllers/controller_banner');
const isAuth = require('../controllers/is-auth');

router.get('/consultar_banners', isAuth, controllerBanner.banners);

router.get('/agregar_banner', isAuth, controllerBanner.agregarBanner);

module.exports = router;