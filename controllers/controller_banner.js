// const { response } = require("express");

exports.banners = (request, response, next) => {
    console.log('Crear nuevo banner');
    response.render('consultarBanners');
};

exports.agregarBanner = (request, response, next) => {
    console.log('Crear nuevo banner');
    response.render('agregarBanner');
};