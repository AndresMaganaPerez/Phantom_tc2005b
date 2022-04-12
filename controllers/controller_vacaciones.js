const { response } = require('express');
const { request } = require('express');
const session = require('express-session');
const Empleados = require('../models/models_empleados');
const Solicitudes = require('../models/models_vacaciones');

exports.solicitarVacaciones = (request, response, next) => {
    console.log(request.body);
    console.log("solicitar mis Vacaciones");
    response.render('vacaciones/nuevaSolicitudVacacion',{
        sesion: request.session.empleado,
        rol: request.session.rol,
        privilegios: request.session.privilegios
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
    response.render('vacaciones/estatusMisVacaciones', {
        sesion: request.session.empleado,
        rol: request.session.rol,
        privilegios: request.session.privilegios
    });
}

exports.postSolicitarVacaciones = (request, response, next) => {
    const vacacion = new Solicitudes(90954, request.body.fechaInicio, request.body.fechaFin, request.body.suplente);
    vacacion.saveSolicitud()
    .then(() => {
        response.redirect('solicitudes_vacaciones/');
    })
    .catch((error) => {
        console.log(error);
    });
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

// Funcion Filtrar solicitudes de vacaciones por Mes
exports.filtraSolVacacionesMes = (request, response, next) => {
    console.log("Filtrando vacaciones");
    const month = request.params.mes;
    Empleados.filtraSolVacacionesMes(month).then(([rows, fieldData]) => {
        response.render('vacaciones/estatusVacaciones', {
            sesion: request.session.empleado,
            rol: request.session.rol,
            privilegios: request.session.privilegios,
            solicitudes: rows
        });
    }).catch((error) => {
        console.log(error);
    })
}