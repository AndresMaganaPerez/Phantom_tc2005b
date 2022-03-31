const express = require('express');

const router = express.Router();

const controllerReportes = require('../controllers/controller_reportes');

router.get('/', controllerReportes.reportes);

module.exports = router;