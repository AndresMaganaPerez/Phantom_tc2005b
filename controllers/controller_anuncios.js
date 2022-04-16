const { response } = require("express");
const Anuncio = require('../models/models_anuncios');

var currentdate = new Date(); //ESTO TE DA LA FECHA ACTUAL
var datetime = currentdate.getDate() + "/" + (currentdate.getMonth()+1)  + "/" + currentdate.getFullYear();

exports.anuncios = (request, response, next) => {
    Anuncio.fetchAll()
    .then(([rows, fieldData]) => {
        response.render('anuncios/anuncios',{
            sesion: request.session.empleado,
            rol: request.session.rol,
            privilegios: request.session.privilegios,
            anuncios: rows
        });
    }).catch((error) => {
        console.log(error);
    });
};

exports.nuevoAnuncio = (request, response, next) => {
    response.render('anuncios/crearAnuncio',{
        sesion: request.session.empleado,
        rol: request.session.rol,
        privilegios: request.session.privilegios,
        fechaDeHoy: datetime
    });
};

exports.postAnuncio = (request, response, next) => {
    const ngb = new NGB(request.session.empleado.idEmpleado,request.body.fecha)
    ngb.save_NGB()
    .then(() =>{
        response.redirect('/general')
    }).catch(err=>{console.log(err)})
};

exports.modificarAnuncio = (request, response, next) => {
    response.render('anuncios/modificarAnuncio',{
        sesion: request.session.empleado,
        rol: request.session.rol,
        privilegios: request.session.privilegios
    })
}