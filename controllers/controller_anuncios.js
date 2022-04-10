const { response } = require("express");

exports.anuncios = (request, response, next) => {
    console.log("Anuncios");
    response.render('anunciosOperador');
};

exports.nuevoAnuncio = (request, response, next) => {
    console.log('Crear nuevo anuncio');
    response.render('crearAnuncio');
};

exports.modificar = (request, response, next) => {
    response.render('modificarAnuncio')
}