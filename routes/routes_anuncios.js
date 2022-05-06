const express = require('express');

const router = express.Router();

const controllerAnuncios = require('../controllers/controller_anuncios');
const isAuth = require('../controllers/is-auth');

router.get('/', isAuth, controllerAnuncios.anuncios);

router.post('/eliminar', isAuth, controllerAnuncios.eliminarAnuncio);

router.post('/modificar', isAuth, controllerAnuncios.modificarAnuncio);

router.get('/nuevo', isAuth, controllerAnuncios.nuevoAnuncio);

router.post('/nuevo', isAuth, controllerAnuncios.postAnuncio);

module.exports = router;