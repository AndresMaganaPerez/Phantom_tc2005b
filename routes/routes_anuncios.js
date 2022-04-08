const express = require('express');

const router = express.Router();

const controllerAnuncios = require('../controllers/controller_anuncios');
const isAuth = require('../controllers/is-auth');

router.get('/', isAuth, controllerAnuncios.anuncios);

router.get('/crear_anuncio', isAuth, controllerAnuncios.nuevoAnuncio);

module.exports = router;