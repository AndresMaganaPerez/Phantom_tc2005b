// const { response } = require("express");
const Banners = require('../models/models_banners');
const fs = require('fs');
const { formatWithOptions } = require('util');
const { on } = require('events');

exports.banners = (request, response, next) => {
    let today = new Date.now();
    let dateStr = today.getFullYear() + '-' + ("0" + today.getMonth()).slice(-2) + '-' + ("0" + today.getDate()).slice(-2);
    Banners.fetchAllBanners()
        .then(([rows, fieldData]) => {
            const banners = rows;
            console.log('Se muestran los banners ya creados');
            response.render('banner/consultarBanners', {
                sesion: request.session.empleado,
                rol: request.session.rol,
                privilegios: request.session.privilegios,
                banners: banners,
                today: dateStr
            });
        })
};

exports.vistaAgregarBanner = (request, response, next) => {
    console.log('Crear nuevo banner');
    let date = new Date(); // Modificar dentro del paréntesis la fecha para hacer pruebas. Ej. ('Dec 10, 2022')
    date.setMonth(date.getMonth() + 2);
    let mes = date.getMonth() + 1;
    let dateStr = date.getFullYear() + '-' + ("0" + mes).slice(-2) + '-' + ("0" + date.getDate()).slice(-2);
    console.log(dateStr);

    response.render('banner/agregarBanner',{
        sesion: request.session.empleado,
        rol: request.session.rol,
        privilegios: request.session.privilegios,
        date: dateStr
    });
};

exports.agregarBanner = (request, response, next) => {
    console.log('Creación en proceso');
    let date= new Date();
    let mes = date.getMonth() + 1;
    let dateStr = date.getFullYear() + '-' + ("0" + mes).slice(-2) + '-' + ("0" + date.getDate()).slice(-2);
    const banner = new Banners(request.file.filename, request.body.expiracion);
    console.log(banner);
    banner.saveBanners()
        .then(() => {
            console.log('Se creó nuevo banner.');
            response.redirect('/banners/consultar_banners/');
        })
        .catch(err => {
            console.log(err);

        })
};