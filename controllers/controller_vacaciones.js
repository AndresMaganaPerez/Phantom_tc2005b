const Solicitudes = require('../models/models_vacaciones');
const Empleados = require('../models/models_empleados');
const fastcsv = require('fast-csv')
const fs = require('fs');
const { formatWithOptions } = require('util');
const { on } = require('events');

exports.solicitarVacaciones = (request, response, next) => {
    console.log(request.body);
    console.log("solicitar mis Vacaciones");
    const date = new Date();
    const fechaSolAux = date.getDate() + '/' + (date.getMonth() + 1) + '/' + date.getFullYear();
    const flag = '';
    response.render('vacaciones/nuevaSolicitudVacacion', {
        sesion: request.session.empleado,
        rol: request.session.rol,
        privilegios: request.session.privilegios,
        fechaSolicitud: fechaSolAux,
        flag: flag
    });
};

exports.cancelarSolicitud = (request, response, next) =>{
    console.log(request.body.delete); //llamar id de solicitud 
    console.log("Eliminando solicitud");
    const id = request.body.delete;
    Solicitudes.borrarSolicitud(request.session.empleado.idEmpleado, id)
    .then(() => {
        response.redirect('/vacaciones/estatus_mis_vacaciones')  
    })
    .catch((err) => {
        console.log(err)
    })
    .catch();  
}

exports.descarga = (request, response, next) => {
    const file = `${__dirname}/../public/Solicitudes.csv`;
  response.download(file);
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
        .catch((err) => {
            console.log(err);
        });
}

exports.postSolicitarVacaciones = (request, response, next) => {
    const vacacion = new Solicitudes(request.session.empleado.idEmpleado, request.body.fechaInicio, request.body.fechaFin, request.body.fechaReanudacion, request.body.suplente);

    const date = new Date();
    const fechaSolAux = date.getDate() + '/' + (date.getMonth() + 1) + '/' + date.getFullYear();
    const dateAux = date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + date.getDate();
    const aux = new Date(dateAux);

    const fechaSolicitud = aux.toISOString().split('T')[0].toString();
    
    const fechaInicio = new Date(request.body.fechaInicio);
    const fechaFin = new Date(request.body.fechaFin);
    const diffTiempo = fechaFin.getTime() - fechaInicio.getTime();
    const vacacionesPedidas = (diffTiempo / (1000 * 3600 * 24)) + 1;
 
    const check1 = request.body.fechaInicio <= fechaSolicitud;
    const check2 = request.body.fechaFin <= fechaSolicitud || request.body.fechaFin < request.body.fechaInicio;
    const check3 = vacacionesPedidas > request.session.empleado.vacacionesTotales;
    const check4 = request.body.fechaReanudacion <= fechaSolicitud || request.body.fechaReanudacion <= request.body.fechaInicio || request.body.fechaReanudacion <= request.body.fechaFin;

    const flag = check1 ? 'FII' : check2 ? 'FFI' : check3 ? 'NVI' : check4 ? 'FRI' : 'success';

    if (flag == 'success') {
        vacacion.saveSolicitud()
            .then(() => {
                response.render('vacaciones/nuevaSolicitudVacacion', {
                    sesion: request.session.empleado,
                    rol: request.session.rol,
                    privilegios: request.session.privilegios,
                    fechaSolicitud: fechaSolAux,
                    flag: flag
                });
            })
            .catch((error) => {
                console.log(error);
            });
    } else {
        response.render('vacaciones/nuevaSolicitudVacacion', {
            sesion: request.session.empleado,
            rol: request.session.rol,
            privilegios: request.session.privilegios,
            fechaSolicitud: fechaSolAux,
            fechaInicio: request.body.fechaInicio,
            fechaFin: request.body.fechaFin,
            fechaReanudacion: request.body.fechaReanudacion,
            suplente: request.body.suplente,
            flag: flag
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


