const { response } = require("express");

exports.anuncios = (request, response, next) => {
    console.log("Anuncios");
    response.render('anunciosAdmin');
};

exports.nuevoAnuncio = (requrest, response, next) => {
    console.log('Crear nuevo anuncio');
    response.render('crearAnuncio');
}; 