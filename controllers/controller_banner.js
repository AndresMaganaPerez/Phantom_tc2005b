// const { response } = require("express");

exports.banners = (request, response, next) => {
    console.log('Crear nuevo banner');
    response.render('banner/consultarBanners');
};

exports.agregarBanner = (request, response, next) => {
    console.log('Crear nuevo banner');
    response.render('banner/agregarBanner');
};