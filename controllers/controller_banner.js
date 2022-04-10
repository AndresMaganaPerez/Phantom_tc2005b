// const { response } = require("express");

exports.banners = (request, response, next) => {
    console.log('Crear nuevo banner');
    response.render('banner/consultarBanners',{
        sesion: request.session.empleado,
        rol: request.session.rol,
        privilegios: request.session.privilegios
    });
};

exports.agregarBanner = (request, response, next) => {
    console.log('Crear nuevo banner');
    response.render('banner/agregarBanner',{
        sesion: request.session.empleado,
        rol: request.session.rol,
        privilegios: request.session.privilegios
    });
};