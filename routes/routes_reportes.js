const express = require('express');

const router = express.Router();

const controllerReportes = require('../controllers/controller_reportes');
const isAuth = require('../controllers/is-auth');

router.get('/', isAuth, controllerReportes.reportes);

module.exports = router;