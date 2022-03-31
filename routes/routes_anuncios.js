const express = require('express');

const routes = express.Router();

const controllerAnuncios = require('../controllers/controller_anuncios');
const router = require('./routes_vista_general');

router.get('/', controllerAnuncios.anuncios);

router.get('/crear_anuncio',controllerAnuncios.nuevoAnuncio);

module.exports = router;