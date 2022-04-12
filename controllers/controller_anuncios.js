const { response } = require("express");

exports.anuncios = (request, response, next) => {
    console.log("Anuncios");
    response.render('anuncios/anunciosAdmin',{
        sesion: request.session.empleado,
        rol: request.session.rol,
        privilegios: request.session.privilegios
    });
};

exports.nuevoAnuncio = (request, response, next) => {
    console.log('Crear nuevo anuncio');
    response.render('anuncios/crearAnuncio',{
        sesion: request.session.empleado,
        rol: request.session.rol,
        privilegios: request.session.privilegios
    });
};

exports.modificar = (request, response, next) => {
    response.render('anuncios/modificarAnuncio',{
        sesion: request.session.empleado,
        rol: request.session.rol,
        privilegios: request.session.privilegios
    })
}