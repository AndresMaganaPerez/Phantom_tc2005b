const express = require('express');

const router = express.Router();

const controllerPerfil = require('../controllers/controller_perfil');

router.get('/',controllerPerfil.perfil);

module.exports = router;