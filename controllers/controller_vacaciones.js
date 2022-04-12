const { response } = require('express');
const { request } = require('express');
const Solicitudes = require('../models/models_vacaciones');


exports.solicitarVacaciones = (request, response, next) => {
    console.log(request.body);
    console.log("solicitar mis Vacaciones");
    const date = new Date();
    const fechaSolAux = date.getDate() + '/' + (date.getMonth() + 1) + '/' + date.getFullYear();
    let flag = '';
    response.render('vacaciones/nuevaSolicitudVacacion',{
        sesion: request.session.empleado,
        rol: request.session.rol,
        privilegios: request.session.privilegios,
        fechaSolicitud: fechaSolAux,
        fechaInicio: '',
        fechaFin: '',
        fechaReanudacion: '',
        flag: flag
    });
};

exports.solicitudesVacacionesSinEstatus = (request, response, next) => {
    response.render('vacaciones/aceptarVacaciones',{
        sesion: request.session.empleado,
        rol: request.session.rol,
        privilegios: request.session.privilegios,
    });
};

exports.estatusMisVacaciones = (request, response, next) => {
    Solicitudes.fetchMisVacaciones(request.session.empleado.idEmpleado)
    .then(([rows, fieldData]) => {
        response.render('vacaciones/estatusMisVacaciones', {
            sesion: request.session.empleado,
            rol: request.session.rol,
            privilegios: request.session.privilegios,
            solicitudes: rows
        });
    })
    .catch();

}

exports.postSolicitarVacaciones = (request, response, next) => {
    const vacacion = new Solicitudes(request.session.empleado.idEmpleado, request.body.fechaInicio, request.body.fechaFin, request.body.fechaReanudacion, request.body.suplente);

    const date = new Date();
    const fechaSolAux = date.getDate() + '/' + (date.getMonth() + 1) + '/' + date.getFullYear();
    const dateAux = date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + date.getDate();
    const aux = new Date(dateAux);
    const fechaSolicitud = aux.toISOString().split('T')[0].toString();
    let flag = '';


    if (request.body.fechaInicio <= fechaSolicitud) {
        flag = 'FII';
        console.log('primer falso');
        response.render('vacaciones/nuevaSolicitudVacacion',{
            sesion: request.session.empleado,
            rol: request.session.rol,
            privilegios: request.session.privilegios,
            fechaSolicitud: fechaSolAux,
            fechaInicio: request.body.fechaInicio,
            fechaFin: request.body.fechaFin,
            fechaReanudacion: request.body.fechaReanudacion,
            flag: flag
        });
        response.redirect('vacaciones/solicitar_mis_vacaciones');
    } else if (request.body.fechaFin <= fechaSolicitud || request.body.fechaFin <= request.body.fechaInicio){
        flag = 'FFI';
        response.render('vacaciones/nuevaSolicitudVacacion',{
            sesion: request.session.empleado,
            rol: request.session.rol,
            privilegios: request.session.privilegios,
            fechaSolicitud: fechaSolAux,
            fechaInicio: request.body.fechaInicio,
            fechaFin: request.body.fechaFin,
            fechaReanudacion: request.body.fechaReanudacion,
            flag: flag
        });
    } else if (request.body.fechaReanudacion <= fechaSolicitud || request.body.fechaReanudacion <= request.body.fechaInicio || request.body.fechaReanudacion <= request.body.fechaFin){
        flag = 'FRI';
        response.render('vacaciones/nuevaSolicitudVacacion',{
            sesion: request.session.empleado,
            rol: request.session.rol,
            privilegios: request.session.privilegios,
            fechaSolicitud: fechaSolAux,
            fechaInicio: request.body.fechaInicio,
            fechaFin: request.body.fechaFin,
            fechaReanudacion: request.body.fechaReanudacion,
            flag: flag
        });
    } else {
    vacacion.saveSolicitud()
    .then(() => {
        response.redirect('solicitudes_vacaciones/');
    })
    .catch((error) => {
        console.log(error);
    });
    }
};

exports.estatusVacaciones = (request, response, next) => {
    //console.log(request.body);
    Solicitudes.fetchAll(90954).then(([rows, fieldData]) => {
        //console.log(rows);
        response.render('vacaciones/estatusVacaciones', {
            sesion: request.session.empleado,
            rol: request.session.rol,
            privilegios: request.session.privilegios,
            solicitudes: rows
        });
    }).catch((error) => {
        console.log(error);
    });
};