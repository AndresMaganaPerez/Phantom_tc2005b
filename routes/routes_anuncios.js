const express = require('express');

const router = express.Router();

const controllerAnuncios = require('../controllers/controller_anuncios');

router.get('/', controllerAnuncios.anuncios);

router.get('/crear_anuncio',controllerAnuncios.nuevoAnuncio);

module.exports = router;