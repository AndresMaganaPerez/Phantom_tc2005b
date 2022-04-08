const express = require('express');

const router = express.Router();

const controllerBanner = require('../controllers/controller_banner');
const isAuth = require('../controllers/is-auth');

router.get('/crear_banner', isAuth, controllerBanner.nuevoBanner);

module.exports = router;