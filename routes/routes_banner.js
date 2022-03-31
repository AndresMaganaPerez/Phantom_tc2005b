const express = require('express');

const router = express.Router();

const controllerBanner = require('../controllers/controller_banner');

router.get('/crear_banner', controllerBanner.nuevoBanner);

module.exports = router;