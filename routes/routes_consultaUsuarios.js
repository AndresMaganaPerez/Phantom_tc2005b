const express = require('express');

const router = express.Router();

const controller_consultaRegistro = require('../controllers/controller_consultaUsuarios');
const isAuth = require('../controllers/is-auth');

router.get('/',isAuth,controller_consultaRegistro.usuarios);

module.exports = router;