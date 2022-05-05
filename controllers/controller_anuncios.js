const { request } = require("express");
const { response } = require("express");
const req = require("express/lib/request");
const Anuncio = require('../models/models_anuncios');

var currentdate = new Date(); //ESTO TE DA LA FECHA ACTUAL
var datetime = currentdate.getDate() + "/" + (currentdate.getMonth()+1)  + "/" + currentdate.getFullYear();

exports.anuncios = (request, response, next) => {
    const flag = '';
    let date= new Date();
    let today = Date.now();
    let mes = date.getMonth() + 1;
    let dateStr = date.getFullYear() + '-' + ("0" + mes).slice(-2) + '-' + ("0" + date.getDate()).slice(-2);
    
    Anuncio.fetchAllPinned(dateStr).then(([rowsPin, fieldData]) => {
        Anuncio.fetchAllUnpinned(dateStr).then(([rowsUnpin, fieldData]) => {
            response.render('anuncios/anuncios',{
                sesion: request.session.empleado,
                rol: request.session.rol,
                privilegios: request.session.privilegios,
                anunciosPinned: rowsPin,
                anunciosUnpinned: rowsUnpin,
                hoy: dateStr,
                fechaDeHoy: dateStr,
                flag: flag
            });
        });
    }).catch((error) => {
        console.log(error);
    });
};

exports.nuevoAnuncio = (request, response, next) => {
    const flag = '';

    let date = new Date(); // Modificar dentro del paréntesis la fecha para hacer pruebas. Ej. ('Dec 10, 2022')
    date.setMonth(date.getMonth() + 2);
    let mes = date.getMonth() + 1;
    let dateStr = date.getFullYear() + '-' + ("0" + mes).slice(-2) + '-' + ("0" + date.getDate()).slice(-2);
    const nuevaFecha = new Date(dateStr);
    
    response.render('anuncios/crearAnuncio',{
        sesion: request.session.empleado,
        rol: request.session.rol,
        privilegios: request.session.privilegios,
        fechaDeHoy: datetime,
        fechaDefault: dateStr,
        flag: flag
    });
};

exports.postAnuncio = (request, response, next) => {
    let date= new Date();
    date.setMonth(date.getMonth() + 2);
    let mes = date.getMonth() + 1;
    let dateStr = date.getFullYear() + '-' + ("0" + mes).slice(-2) + '-' + ("0" + date.getDate()).slice(-2);
    
    let fActual = new Date();
    let month = fActual.getMonth() + 1;
    let aux_f = fActual.getFullYear() + '-' + ("0" + month).slice(-2) + '-' + ("0" + fActual.getDate()).slice(-2);

    console.log(aux_f);

    console.log(request.body.expiracion);
    
    const elim = 0;
    
    const anuncio = new Anuncio(dateStr, request.body.titulo, request.body.pin, request.body.expiracion, request.body.texto, request.file ? request.file.filename : null, elim);

    if (request.body.expiracion > aux_f) {
        const flag = 'success';

        anuncio.saveAnuncio()
            .then(() => {
                response.render('anuncios/crearAnuncio', {
                    sesion: request.session.empleado,
                    rol: request.session.rol,
                    privilegios: request.session.privilegios,
                    fechaDeHoy: datetime,
                    fechaDefault: dateStr,
                    flag: flag
                });
            }).catch(err => {
                console.log(err);
            })
    } else {
        const flag = 'fail';
        
        let date = new Date(); // Modificar dentro del paréntesis la fecha para hacer pruebas. Ej. ('Dec 10, 2022')
        date.setMonth(date.getMonth() + 2);
        let mes = date.getMonth() + 1;
        let dateStr = date.getFullYear() + '-' + ("0" + mes).slice(-2) + '-' + ("0" + date.getDate()).slice(-2);
        
        response.render('anuncios/crearAnuncio', {
            sesion: request.session.empleado,
            rol: request.session.rol,
            privilegios: request.session.privilegios,
            expiracion: request.body.expiracion,
            fechaDeHoy: datetime,
            fechaDefault: dateStr,
            flag: flag
        });
    }
};

exports.modificarAnuncio = (request, response, next) => {
    let date= new Date();
    const aux = new Date(request.body.expiracion);

    let today = Date.now();
    let mes = date.getMonth() + 1;
    let dateStr = date.getFullYear() + '-' + ("0" + mes).slice(-2) + '-' + ("0" + date.getDate()).slice(-2);

    const idA = request.body.id_anuncio;
    const idR = request.body.id_recurso_digital;
    
    if (aux > date) {
        const flag = 'success_mod';
        
        let pin_status = 0;
        if (request.body.pin == 'on') {
            pin_status = 1;
        }

        console.log(idA);
    console.log(idR);
    console.log(request.body.titulo);
    console.log(pin_status);
    console.log(request.body.expiracion);
    console.log(request.body.texto);
    console.log(request.file);

        Anuncio.modificarAnuncio(idA, idR, dateStr, request.body.titulo, pin_status, request.body.expiracion, request.body.texto, request.file ? request.filename: null).then(() => {
            Anuncio.fetchAllPinned(dateStr).then(([rowsPin, fieldData]) => {
                Anuncio.fetchAllUnpinned(dateStr).then(([rowsUnpin, fieldData]) => {
                    response.render('anuncios/anuncios',{
                        sesion: request.session.empleado,
                        rol: request.session.rol,
                        privilegios: request.session.privilegios,
                        anunciosPinned: rowsPin,
                        anunciosUnpinned: rowsUnpin,
                        hoy: dateStr,
                        fechaDeHoy: dateStr,
                        flag: flag
                    });
                }).catch((error) => {
                    console.log(error);
                })
            }).catch((error) => {
                console.log(error);
            })
        }).catch(err => {
            console.log(err);
        });
    } else {
        const flag = 'fail_mod';
        
        console.log('No ingresó correctamente la fecha');
        
        console.log(dateStr);

        Anuncio.fetchAllPinned(dateStr).then(([rowsPin, fieldData]) => {
            Anuncio.fetchAllUnpinned(dateStr).then(([rowsUnpin, fieldData]) => {
                response.render('anuncios/anuncios',{
                    sesion: request.session.empleado,
                    rol: request.session.rol,
                    privilegios: request.session.privilegios,
                    anunciosPinned: rowsPin,
                    anunciosUnpinned: rowsUnpin,
                    expiracion: request.body.expiracion,
                    hoy: dateStr,
                    fechaDeHoy: dateStr,
                    flag: flag
                });
            }).catch((error) => {
                console.log(error);
            })
        }).catch((error) => {
            console.log(error);
        })
    }
}

exports.eliminarAnuncio = (request, response, next) => {
    const flag = 'anuncio_eliminado';
    let date= new Date();
    let today = Date.now();
    let mes = date.getMonth() + 1;
    let dateStr = date.getFullYear() + '-' + ("0" + mes).slice(-2) + '-' + ("0" + date.getDate()).slice(-2);

    const idA = request.body.id_anuncio;
    
    console.log(idA);
    
    Anuncio.eliminarAnuncio(idA).then(() => {
        Anuncio.fetchAllPinned(dateStr).then(([rowsPin, fieldData]) => {
            Anuncio.fetchAllUnpinned(dateStr).then(([rowsUnpin, fieldData]) => {
                response.render('anuncios/anuncios',{
                    sesion: request.session.empleado,
                    rol: request.session.rol,
                    privilegios: request.session.privilegios,
                    anunciosPinned: rowsPin,
                    anunciosUnpinned: rowsUnpin,
                    hoy: dateStr,
                    fechaDeHoy: dateStr,
                    flag: flag
                });
            }).catch((error) => {
                console.log(error);
            })
        }).catch((error) => {
            console.log(error);
        })
    }).catch(err => {
        console.log(err);
    });
}