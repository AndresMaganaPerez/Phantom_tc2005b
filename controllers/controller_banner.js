// const { response } = require("express");
const Banners = require('../models/models_banners');
const fs = require('fs');
const { formatWithOptions } = require('util');

exports.banners = (request, response, next) => {

    const flag = request.session.flag;
    delete request.session.flag;

    Banners.fetchAllBanners()
        .then(([rows, fieldData]) => {
            const banners = rows;
            console.log('Se muestran los banners ya creados');
            response.render('banner/consultarBanners', {
                sesion: request.session.empleado,
                rol: request.session.rol,
                privilegios: request.session.privilegios,
                banners: banners,
                flag: flag
            });
        })
};

exports.vistaAgregarBanner = (request, response, next) => {
    console.log('Crear nuevo banner');
    let date = new Date(); // Modificar dentro del paréntesis la fecha para hacer pruebas. Ej. ('Dec 10, 2022')
    date.setMonth(date.getMonth() + 2);
    let mes = date.getMonth() + 1;
    let dateStr = date.getFullYear() + '-' + ("0" + mes).slice(-2) + '-' + ("0" + date.getDate()).slice(-2);
    const nuevaFecha = new Date(dateStr);
    console.log(nuevaFecha);
    console.log(dateStr);
    const flag = '';

    response.render('banner/agregarBanner',{
        sesion: request.session.empleado,
        rol: request.session.rol,
        privilegios: request.session.privilegios,
        date: dateStr,
        flag: flag
    });
};

exports.agregarBanner = (request, response, next) => {
    console.log('Creación en proceso');
    let today = new Date();
    const banner = new Banners(request.file.filename, request.body.expiracion);
    const aux = new Date(request.body.expiracion);


    if (aux > today) {
        let date = new Date(); // Modificar dentro del paréntesis la fecha para hacer pruebas. Ej. ('Dec 10, 2022')
        date.setMonth(date.getMonth() + 2);
        let mes = date.getMonth() + 1;
        let dateStr = date.getFullYear() + '-' + ("0" + mes).slice(-2) + '-' + ("0" + date.getDate()).slice(-2);
        const flag = 'success';
        banner.saveBanners()
            .then(() => {
                console.log('Se creó nuevo banner.');
                response.render('banner/agregarBanner', {
                    sesion: request.session.empleado,
                    rol: request.session.rol,
                    privilegios: request.session.privilegios,
                    date: dateStr,
                    flag: flag
                });
            })
            .catch(err => {
                console.log(err);
            })
    } else {
        const flag = 'fail';
        console.log('No ingresó correctamente la fecha');
        let date = new Date(); // Modificar dentro del paréntesis la fecha para hacer pruebas. Ej. ('Dec 10, 2022')
        date.setMonth(date.getMonth() + 2);
        let mes = date.getMonth() + 1;
        let dateStr = date.getFullYear() + '-' + ("0" + mes).slice(-2) + '-' + ("0" + date.getDate()).slice(-2);
        console.log(dateStr);
        response.render('banner/agregarBanner', {
            sesion: request.session.empleado,
            rol: request.session.rol,
            privilegios: request.session.privilegios,
            imagen: request.file.filename,
            expiracion: request.body.expiracion,
            date: dateStr,
            flag: flag
        });
    }
};

exports.eliminarBanner = (request, response, next) => {
    const idBanner = request.body.idBanner;
    Banners.deleteBanner(idBanner)
        .then(([rows, fieldData]) => {
            const banners = rows;
            console.log('Se modificó atributo visibilidad.')
            response.redirect('/banners/consultar_banners/');
        })
        .catch(err => {
            console.log(err);
        })
};

exports.modificarBanner = (request, response, next) => {
    const today = new Date();
    const aux = new Date(request.body.expiracion);

    if (aux > today) {

        const file = request.file ? request.file.filename : '';

        Banners.modificarBanner(file, request.body.expiracion, request.body.idBanner, request.body.idRecursoDigital)
            .then(([rows, fieldData]) => {
                const banners = rows;
                console.log('Se modificó nuevo banner.');
                request.session.flag = "success";
                response.redirect('/banners/consultar_banners/');
            }) .catch(err => {
            console.log(err);
            })
    } else {
        request.session.flag = "fail";
        response.redirect('/banners/consultar_banners/');
    }
};