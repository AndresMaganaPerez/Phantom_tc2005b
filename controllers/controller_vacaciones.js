const Solicitudes = require('../models/models_vacaciones');
const fastcsv = require('fast-csv')
const fs = require('fs');
const { formatWithOptions } = require('util');
const { on } = require('events');

exports.solicitarVacaciones = (request, response, next) => {
    console.log(request.body);
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
    console.log(request.body.idSol);
    console.log(request.body.estatus);
    console.log(request.body.fechaIn)
    console.log(request.body.fechaF);

    function diasVacaciones(fechaI, fechaF) {
        let fechaInicio = new Date(fechaI);
        const fechaFin = new Date(fechaF);
    
        let diasVacaciones = 1;
        while (fechaInicio < fechaFin){
            if (fechaInicio.getUTCDay() != 0){
                if (fechaInicio.getUTCDay() != 6) {
                    diasVacaciones = diasVacaciones + 1;
                }
            }
            fechaInicio.setDate(fechaInicio.getDate() + 1);
        }
        return diasVacaciones;
    }

    const fechaInicio = new Date(request.body.fechaIn);
    const fechaFin = new Date(request.body.fechaF);
    const vacacionesUsadas = diasVacaciones(fechaInicio, fechaFin);

    console.log(vacacionesUsadas);
    if (request.body.estatus == '') {
        Solicitudes.borrarSolicitudSinStatus(request.session.empleado.idEmpleado, request.body.idSol)
        .then(() => {
            response.redirect('/vacaciones/estatus_mis_vacaciones');
        })
        .catch((err) => {
            console.log(err);
        }) 
    } else if (request.body.estatus == 1) {
        Solicitudes.borrarSolicitudConStatus(request.session.empleado.idEmpleado, request.body.idSol, vacacionesUsadas)
        .then(() => {
            response.redirect('/vacaciones/estatus_mis_vacaciones');
        })
        .catch((error) => {
            console.log(error);
        })
    }
}

exports.descarga = (request, response, next) => {
    const file = `${__dirname}/../public/Solicitudes.csv`;
  response.download(file);
}

// Controlador para desplegar las solicitudes enviadas al lider en sesión.
exports.solicitudesVacacionesSinEstatus = (request, response, next) => {
    Solicitudes.fetchSolVacParaLider(request.session.empleado.idEmpleado)
        .then(([rows, fieldData]) => {
            const solicitudes = rows;
            console.log(rows);
            console.log('Consulta hecha con éxito');
            response.render('vacaciones/aceptarVacaciones', {
                sesion: request.session.empleado,
                rol: request.session.rol,
                privilegios: request.session.privilegios,
                solicitudes: solicitudes
            });
        })
        .catch((err) => {
            console.log(err);
        });
};

// Controlador para Aceptar Solicitudes de Vacaciones
exports.aceptarSolicitudesEstatus = (request, response, next) => {
    function diasVacaciones(fechaI, fechaF) {
        let fechaInicio = new Date(fechaI);
        const fechaFin = new Date(fechaF);
    
        let diasVacaciones = 1;
        while (fechaInicio < fechaFin){
            if (fechaInicio.getUTCDay() != 0){
                if (fechaInicio.getUTCDay() != 6) {
                    diasVacaciones = diasVacaciones + 1;
                }
            }
            fechaInicio.setDate(fechaInicio.getDate() + 1);
        }
        return diasVacaciones;
    }

    const fechaInicio = new Date(request.body.fechaInicio);
    const fechaFin = new Date(request.body.fechaFin);

    const vacasUsadas = diasVacaciones(fechaInicio, fechaFin);

    Solicitudes.aceptarVacas(request.body.idSolicitud, vacasUsadas,request.body.idEmpleado)
        .then(([rows, fieldData]) => {
            response.redirect('/vacaciones/solicitudes_vacaciones');
        })
        .catch((err) => {
            console.log(err);
        });
}

// Controlador para Rechazar Solicitudes de Vacaciones
exports.rechazarSolicitudesEstatus = (request, response, next) => {
    const nota = request.body.nota == '' ? null : request.body.nota;
    Solicitudes.rechazarVacas(request.body.idSolicitud, nota)
        .then(([rows, fieldData]) => {
            console.log('Rechazo hecho con éxito');
            response.redirect('/vacaciones/solicitudes_vacaciones');
        })
        .catch((err) => {
            console.log(err);
        });
}

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
    
    function diasVacaciones(fechaI, fechaF) {
        let fechaInicio = new Date(fechaI);
        const fechaFin = new Date(fechaF);
    
        let diasVacaciones = 1;
        while (fechaInicio < fechaFin){
            if (fechaInicio.getUTCDay() != 0){
                if (fechaInicio.getUTCDay() != 6) {
                    diasVacaciones = diasVacaciones + 1;
                }
            }
            fechaInicio.setDate(fechaInicio.getDate() + 1);
        }
        return diasVacaciones;
    }

    const date = new Date();
    const fechaSolAux = date.getDate() + '/' + (date.getMonth() + 1) + '/' + date.getFullYear();
    const dateAux = date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + date.getDate();
    const aux = new Date(dateAux);

    const fechaSolicitud = aux.toISOString().split('T')[0].toString();
    
    const fechaInicio = new Date(request.body.fechaInicio);
    const fechaFin = new Date(request.body.fechaFin);
    const fechaReanudacion = new Date(request.body.fechaReanudacion);
    
    const vacacionesPedidas = diasVacaciones(fechaInicio, fechaFin);

    const check1 = request.body.fechaInicio <= fechaSolicitud;
    const check1_1 = fechaInicio.getUTCDay() == 0 || fechaInicio.getUTCDay() == 6;
    const check2 = request.body.fechaFin < request.body.fechaInicio;
    const check2_2 = fechaFin.getUTCDay() == 0 || fechaFin.getUTCDay() == 6;
    const check3 = vacacionesPedidas > request.session.empleado.vacacionesTotales;
    const check4 = request.body.fechaReanudacion <= fechaSolicitud || request.body.fechaReanudacion <= request.body.fechaInicio || request.body.fechaReanudacion <= request.body.fechaFin;
    const check4_4 = fechaReanudacion.getUTCDay() == 0 || fechaReanudacion.getUTCDay() == 6;
    const flag = check1 ? 'FII' : check1_1 ? 'FISB' : check2 ? 'FFI' : check2_2 ? 'FFSB' : check3 ? 'NVI' : check4 ? 'FRI' : check4_4 ? 'FRSB' : 'success';

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
    Solicitudes.fetchAllVacaciones().then(([rows, fieldData]) => {
        const data = rows;
        Solicitudes.fetchAreas()
            .then(([areas, fieldData]) => {
                const data = rows;
                var ws = fs.createWriteStream('public/Solicitudes.csv');
                fastcsv
                    .write(data, {headers:true})
                    .on('finish', function() {
                        response.render('vacaciones/estatusVacaciones', {
                            sesion: request.session.empleado,
                            rol: request.session.rol,
                            privilegios: request.session.privilegios,
                            solicitudes: rows,
                            areas: areas
                        })
                    }).pipe(ws);
            }).catch((error) => {
                console.log(error);
            });
        }).catch((error) => {
            console.log(error);
        });
};

// Funcion Filtrar solicitudes de vacaciones por Mes y Área
exports.filtraSolVacaciones = (request, response, next) => {
    const monar = request.params.mesar;
    console.log(monar);
    Solicitudes.filtraSolVacacionesMes(monar)
        .then(([rows, fieldData]) => {
            Solicitudes.fetchAreas()
                .then(([areas, fieldData]) => {
                    response.render('vacaciones/estatusVacaciones', {
                        sesion: request.session.empleado,
                        rol: request.session.rol,
                        privilegios: request.session.privilegios,
                        solicitudes: rows,
                        areas: areas
                });
        });
    }).catch((error) => {
        console.log(error);
    });
};


