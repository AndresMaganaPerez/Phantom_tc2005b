// const { response } = require("express");

exports.nuevoBanner = (request, response, next) => {
    console.log('Crear nuevo banner');
    response.render('crearBanner');
};