const Solicitudes = require('../models/models_vacaciones');
const fastcsv = require('fast-csv')
const fs = require('fs');
const { formatWithOptions } = require('util');
const { on } = require('events');

exports.solicitarVacaciones = (request, response, next) => {
    console.log(request.body);
    console.log("solicitar mis Vacaciones");
    const date = new Date();
    const fechaSolAux = date.getDate() + '/' + (date.getMonth() + 1) + '/' + date.getFullYear();
    let flag = '';
    response.render('vacaciones/nuevaSolicitudVacacion', {
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

exports.cancelarSolicitud = (request, response, next) =>{
    console.log(request.body.delete);
}

exports.solicitudesVacacionesSinEstatus = (request, response, next) => {
    response.render('vacaciones/aceptarVacaciones', {
        sesion: request.session.empleado,
        rol: request.session.rol,
        privilegios: request.session.privilegios,
    });
};

exports.estatusMisVacaciones = (request, response, next) => {
    Solicitudes.fetchMisVacaciones(request.session.empleado.idEmpleado)
        .then(([rows, fieldData]) => {
            const misVacaciones = rows;
            Solicitudes.fetchLider(request.session.empleado.idEmpleado)
                .then(([rows, fieldData]) => {
                    const lider = rows[0];
                    console.log(lider);
                    response.render('vacaciones/estatusMisVacaciones', {
                        sesion: request.session.empleado,
                        rol: request.session.rol,
                        privilegios: request.session.privilegios,
                        solicitudes: misVacaciones,
                        lider: lider
                    });
                })
                .catch((err) => {
                    console.log(err);
                })

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

    const fechaInicio = new Date(request.body.fechaInicio);
    const fechaFin = new Date(request.body.fechaFin);

    const vacacionesPedidas = fechaFin.getDate() - fechaInicio.getDate() + 1;
    if (request.body.fechaInicio <= fechaSolicitud) {
        flag = 'FII';
        console.log('primer falso');
        response.render('vacaciones/nuevaSolicitudVacacion', {
            sesion: request.session.empleado,
            rol: request.session.rol,
            privilegios: request.session.privilegios,
            fechaSolicitud: fechaSolAux,
            fechaInicio: request.body.fechaInicio,
            fechaFin: request.body.fechaFin,
            fechaReanudacion: request.body.fechaReanudacion,
            flag: flag
        });
    } else if (request.body.fechaFin <= fechaSolicitud || request.body.fechaFin < request.body.fechaInicio) {
        flag = 'FFI';
        response.render('vacaciones/nuevaSolicitudVacacion', {
            sesion: request.session.empleado,
            rol: request.session.rol,
            privilegios: request.session.privilegios,
            fechaSolicitud: fechaSolAux,
            fechaInicio: request.body.fechaInicio,
            fechaFin: request.body.fechaFin,
            fechaReanudacion: request.body.fechaReanudacion,
            flag: flag
        });
    } else if (vacacionesPedidas > request.session.empleado.vacacionesTotales) {
        flag = 'NVI';
        response.render('vacaciones/nuevaSolicitudVacacion', {
            sesion: request.session.empleado,
            rol: request.session.rol,
            privilegios: request.session.privilegios,
            fechaSolicitud: fechaSolAux,
            fechaInicio: request.body.fechaInicio,
            fechaFin: request.body.fechaFin,
            fechaReanudacion: request.body.fechaReanudacion,
            flag: flag
        });
    } else if (request.body.fechaReanudacion <= fechaSolicitud || request.body.fechaReanudacion <= request.body.fechaInicio || request.body.fechaReanudacion <= request.body.fechaFin) {
        flag = 'FRI';
        response.render('vacaciones/nuevaSolicitudVacacion', {
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
        flag = 'success';
        vacacion.saveSolicitud()
            .then(() => {
                response.render('vacaciones/nuevaSolicitudVacacion', {
                    sesion: request.session.empleado,
                    rol: request.session.rol,
                    privilegios: request.session.privilegios,
                    fechaSolicitud: fechaSolAux,
                    fechaInicio: '',
                    fechaFin: '',
                    fechaReanudacion: '',
                    flag: flag
                });
            })
            .catch((error) => {
                console.log(error);
            });
    }
};

exports.estatusVacaciones = (request, response, next) => {
    //console.log(request.body);
    Solicitudes.fetchAllVacaciones().then(([rows, fieldData]) => {
        const data = rows;
        var ws = fs.createWriteStream('public/Solicitudes.csv');
        fastcsv
        .write(data, {headers:true})
        .on('finish', function() {
            response.render('vacaciones/estatusVacaciones', {
                sesion: request.session.empleado,
                rol: request.session.rol,
                privilegios: request.session.privilegios,
                solicitudes: rows
            });
        }).pipe(ws);
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
    });

};


