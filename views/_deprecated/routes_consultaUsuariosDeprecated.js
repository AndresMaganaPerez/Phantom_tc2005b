const express = require('express');

const router = express.Router();

const controller_consultaRegistro = require('../controllers/controller_consultaUsuarios');
const isAuth = require('../../controllers/is-auth');

router.get('/',isAuth,controller_consultaRegistro.usuarios);

router.post('/',isAuth, controller_consultaRegistro.borrarUsuario);

router.get('/buscar/:criterio',isAuth,controller_consultaRegistro.buscarUsuario)
module.exports = router;