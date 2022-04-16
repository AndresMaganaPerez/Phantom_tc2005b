const express = require('express');

const router = express.Router();

const controllerAnuncios = require('../controllers/controller_anuncios');
const isAuthAdminRH = require('../controllers/is-authAdminRH');
const isAuthLider = require('../controllers/is-authLider');
const isAuthOperador = require('../controllers/is-authOperador');
const isAuth = require('../controllers/is-auth');

router.get('/', isAuth, controllerAnuncios.anuncios);

router.get('/nuevo', isAuth, controllerAnuncios.nuevoAnuncio);

router.get('/modificar', controllerAnuncios.modificarAnuncio);

module.exports = router;