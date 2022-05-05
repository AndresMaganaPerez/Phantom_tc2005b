const { request } = require("express");
const { response } = require("express");
const req = require("express/lib/request");
const Anuncio = require('../models/models_anuncios');
const {Storage} = require('@google-cloud/storage');

const storage = new Storage({
    projectId: process.env.GCLOUD_PROJECT, 
    credentials: {client_email: process.env.GCLOUD_CLIENT_EMAIL, 
    private_key: process.env.GCLOUD_PRIVATE_KEY}
});

const bucket = storage.bucket(process.env.GCLOUD_STORAGE_BUCKET)

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
    
    console.log(dateStr);
    
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
    let today = Date.now();
    let mes = date.getMonth() + 1;
    let dateStr = date.getFullYear() + '-' + ("0" + mes).slice(-2) + '-' + ("0" + date.getDate()).slice(-2);
    const elim = 0;
    if (request.body.expiracion > dateStr) {
        const flag = 'success';
        if (request.file != null) {
            const newFileName = new Date().getTime() + '-' + request.file.originalname;
            const blob = bucket.file(newFileName);
            const blobStream = blob.createWriteStream();

            blobStream.on("error", err => console.log(err));
            
            blobStream.on("finish", () =>{
                const publicUrl = `https://storage.googleapis.com/${process.env.GCLOUD_STORAGE_BUCKET}/${blob.name}`;
                const anuncio = new Anuncio(dateStr, request.body.titulo, request.body.pin, request.body.expiracion, request.body.texto, publicUrl, elim);
                anuncio.saveAnuncio()
                .then(() => {
                    response.render('anuncios/crearAnuncio', {
                        sesion: request.session.empleado,
                        rol: request.session.rol,
                        privilegios: request.session.privilegios,
                        fechaDeHoy: datetime,
                        flag: flag
                    });
                }).catch(err => {
                    console.log(err);
                })
            });
            blobStream.end(request.file.buffer);
        } else {
            const anuncio = new Anuncio(dateStr, request.body.titulo, request.body.pin, request.body.expiracion, request.body.texto, request.file ? request.file.filename : null, elim);
            anuncio.saveAnuncio()
            .then(() => {
                response.render('anuncios/crearAnuncio', {
                    sesion: request.session.empleado,
                    rol: request.session.rol,
                    privilegios: request.session.privilegios,
                    fechaDeHoy: datetime,
                    flag: flag
                });
            }).catch(err => {
                console.log(err);
            })
        }
    } else {
        const flag = 'fail';
        
        let date = new Date(); // Modificar dentro del paréntesis la fecha para hacer pruebas. Ej. ('Dec 10, 2022')
        date.setMonth(date.getMonth() + 2);
        let mes = date.getMonth() + 1;
        let dateStr = date.getFullYear() + '-' + ("0" + mes).slice(-2) + '-' + ("0" + date.getDate()).slice(-2);
        
        console.log(dateStr);
        response.render('anuncios/crearAnuncio', {
            sesion: request.session.empleado,
            rol: request.session.rol,
            privilegios: request.session.privilegios,
            expiracion: request.body.expiracion,
            fechaDeHoy: datetime,
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