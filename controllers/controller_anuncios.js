const { response } = require("express");

exports.anuncios = (request, response, next) => {
    console.log("Anuncios");
    response.render('anuncios/anunciosAdmin');
};

exports.nuevoAnuncio = (request, response, next) => {
    console.log('Crear nuevo anuncio');
    response.render('anuncios/crearAnuncio');
};

exports.modificar = (request, response, next) => {
    response.render('anuncios/modificarAnuncio')
}