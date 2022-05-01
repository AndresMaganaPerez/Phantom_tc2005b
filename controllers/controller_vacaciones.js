const Solicitudes = require('../models/models_vacaciones');
const fastcsv = require('fast-csv')
const fs = require('fs');
const { formatWithOptions } = require('util');
const { on } = require('events');
const { info } = require('console');

const resultadosPorPagina = 10;

exports.solicitarVacaciones = (request, response, next) => {
    console.log(request.body);
    const date = new Date();
    const fechaSolAux = date.getDate() + '/' + (date.getMonth() + 1) + '/' + date.getFullYear();
    const flag = '';
    Solicitudes.fetchVacacionesRestantes(request.session.empleado.idEmpleado)
    .then(([rows, fieldData]) => {
        const vacacionesRestantes = rows[0].vacacionesTotalesAux;
        response.render('vacaciones/nuevaSolicitudVacacion', {
            sesion: request.session.empleado,
            rol: request.session.rol,
            privilegios: request.session.privilegios,
            fechaSolicitud: fechaSolAux,
            flag: flag,
            vacacionesRestantes: vacacionesRestantes
        });
    })
    .catch((error) => {
        console.log(error);
    })

};

exports.cancelarSolicitud = (request, response, next) =>{
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
    const flag = 'solicitudCancelada';

    if (request.body.estatus == '') {
        Solicitudes.fetchSolicitud(request.body.idSol)
        .then(([solicitud, fieldData]) => {
            const infoSolicitud = solicitud[0];
            Solicitudes.borrarSolicitudSinStatus(request.session.empleado.idEmpleado, request.body.idSol, vacacionesUsadas)
            .then(() => {
                Solicitudes.fetchMisVacaciones(request.session.empleado.idEmpleado)
                .then(([vacaciones, fieldData]) => {
                    const currentDate = new Date();
                    const numeroDeResultados = vacaciones.length;
                    const numeroDePaginas = Math.ceil(numeroDeResultados / resultadosPorPagina);
                    const page = request.query.page ? Number(request.query.page) : 1;
                    if (numeroDeResultados > 0){
                        if (page > numeroDePaginas) {
                            response.redirect('vacaciones/estatus_mis_vacaciones/?page=' + encodeURIComponent(numeroDePaginas));
                        } else if (page < 1) {
                            response.redirect('vacaciones/estatus_mis_vacaciones/?page=' + encodeURIComponent('1'));
                        }
                    }
                    const inicioLimite = (page - 1) * resultadosPorPagina;
                    Solicitudes.fetchLider(request.session.empleado.idEmpleado)
                    .then(([miLider, fieldData]) => {
                        const lider = miLider[0];
                        Solicitudes.fetchPaginacionMisVacaciones(request.session.empleado.idEmpleado, inicioLimite, resultadosPorPagina).then(([vacaciones, fieldData]) => {
                            let iterator = (page - 2) < 1 ? 1 : page - 2;
                            const paginaFinal = (iterator + 4) <= numeroDePaginas ? (iterator + 4) : numeroDePaginas;
                            if ((page + 2) > numeroDePaginas && (page - 2) > 1) {
                                iterator = numeroDePaginas - 4;
                            }
                            response.render('vacaciones/estatusMisVacaciones', {
                                sesion: request.session.empleado,
                                rol: request.session.rol,
                                privilegios: request.session.privilegios,
                                solicitudes: vacaciones, page, iterator, paginaFinal, numeroDePaginas,
                                lider: lider,
                                diaActual: currentDate,
                                flag: flag,
                                infoSolicitud: infoSolicitud
                            });
                        }).catch((error) => {
                            console.log(error);
                        })
                        
                    })
                    .catch((err) => {
                        console.log(err);
                    })
                })
                .catch((err) => {
                    console.log(err);
                });
            })
            .catch((err) => {
                console.log(err);
            }) 
        })
        .catch((error) => {
            console.log(error);
        })
    } else if (request.body.estatus == 1) {
        Solicitudes.fetchSolicitud(request.body.idSol)
        .then(([solicitud, fieldData]) => {
            const infoSolicitud = solicitud[0];
            Solicitudes.borrarSolicitudConStatus(request.session.empleado.idEmpleado, request.body.idSol, vacacionesUsadas)
            .then(() => {
                Solicitudes.fetchMisVacaciones(request.session.empleado.idEmpleado)
                .then(([rows, fieldData]) => {
                    const currentDate = new Date();
                    const numeroDeResultados = rows.length;
                    const numeroDePaginas = Math.ceil(numeroDeResultados / resultadosPorPagina);
                    const page = request.query.page ? Number(request.query.page) : 1;
                    if (numeroDeResultados > 0){
                        if (page > numeroDePaginas) {
                            response.redirect('vacaciones/estatus_mis_vacaciones/?page=' + encodeURIComponent(numeroDePaginas));
                        } else if (page < 1) {
                            response.redirect('vacaciones/estatus_mis_vacaciones/?page=' + encodeURIComponent('1'));
                        }
                    }
                    const inicioLimite = (page - 1) * resultadosPorPagina;
                    Solicitudes.fetchLider(request.session.empleado.idEmpleado)
                    .then(([rows, fieldData]) => {
                        const lider = rows[0];
                        Solicitudes.fetchPaginacionMisVacaciones(request.session.empleado.idEmpleado, inicioLimite, resultadosPorPagina).then(([vacaciones, fieldData]) => {
                            let iterator = (page - 2) < 1 ? 1 : page - 2;
                            const paginaFinal = (iterator + 4) <= numeroDePaginas ? (iterator + 4) : numeroDePaginas;
                            if ((page + 2) > numeroDePaginas && (page - 2) > 1) {
                                iterator = numeroDePaginas - 4;
                            }
                            response.render('vacaciones/estatusMisVacaciones', {
                                sesion: request.session.empleado,
                                rol: request.session.rol,
                                privilegios: request.session.privilegios,
                                solicitudes: vacaciones, page, iterator, paginaFinal, numeroDePaginas,
                                lider: lider,
                                diaActual: currentDate,
                                flag: flag,
                                infoSolicitud: infoSolicitud
                            });
                        })
                        .catch((error) => {
                            console.log(error);
                        })
                    })
                    .catch((err) => {
                        console.log(err);
                    })
                })
                .catch((err) => {
                    console.log(err);
                });
            })
            .catch((error) => {
                console.log(error);
            });
        })
        .catch((error) => {
            console.log(error);
        });
    }
}

exports.descarga = (request, response, next) => {
    const file = `${__dirname}/../public/Solicitudes.csv`;
  response.download(file);
}

// Controlador para desplegar las solicitudes enviadas al lider en sesión.
exports.solicitudesVacacionesSinEstatus = (request, response, next) => {
    const flag = '';
    Solicitudes.fetchSolVacParaLider(request.session.empleado.idEmpleado)
        .then(([rows, fieldData]) => {
            const solicitudes = rows;
            console.log('Consulta hecha con éxito');
            response.render('vacaciones/aceptarVacaciones', {
                sesion: request.session.empleado,
                rol: request.session.rol,
                privilegios: request.session.privilegios,
                solicitudes: solicitudes,
                flag: flag
            });
        })
        .catch((err) => {
            cnsole.log(err);
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

    const flag = 'solicitudAceptada';

    Solicitudes.aceptarVacas(request.body.idSolicitud, vacasUsadas,request.body.idEmpleado)
    .then(() => {
        Solicitudes.fetchSolicitud(request.body.idSolicitud)
        .then(([solicitud, fieldData]) => {
            const infoSolicitud = solicitud[0];
            Solicitudes.fetchSolVacParaLider(request.session.empleado.idEmpleado)
            .then(([rows, fieldData]) => {
                const solicitudes = rows;
                response.render('vacaciones/aceptarVacaciones', {
                    sesion: request.session.empleado,
                    rol: request.session.rol,
                    privilegios: request.session.privilegios,
                    solicitudes: solicitudes,
                    infoSolicitud: infoSolicitud,
                    flag: flag
                });
            })
            .catch((err) => {
                cnsole.log(err);
            });
        })
        .catch((error) => {
            console.log(error);
        })
    })
    .catch((err) => {
        console.log(err);
    });
}

// Controlador para Rechazar Solicitudes de Vacaciones
exports.rechazarSolicitudesEstatus = (request, response, next) => {
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
    const vacacionesPedidas = diasVacaciones(fechaInicio, fechaFin);
    
    const flag = 'solicitudRechazada';

    const nota = request.body.nota == '' ? null : request.body.nota;
    Solicitudes.rechazarVacas(request.body.idSolicitud, nota, vacacionesPedidas)
        .then(([rows, fieldData]) => {
            Solicitudes.fetchSolicitud(request.body.idSolicitud)
            .then(([solicitud, fieldData]) => {
                const infoSolicitud = solicitud[0];
                Solicitudes.fetchSolVacParaLider(request.session.empleado.idEmpleado)
                .then(([rows, fieldData]) => {
                    const solicitudes = rows;
                    response.render('vacaciones/aceptarVacaciones', {
                        sesion: request.session.empleado,
                        rol: request.session.rol,
                        privilegios: request.session.privilegios,
                        solicitudes: solicitudes,
                        infoSolicitud: infoSolicitud,
                        flag: flag
                    });
                })
                .catch((err) => {
                    cnsole.log(err);
                });
            })
            .catch((error) => {
                console.log(error);
            })
        })
        .catch((err) => {
            console.log(err);
        });
}

exports.estatusMisVacaciones = (request, response, next) => {
    Solicitudes.fetchMisVacaciones(request.session.empleado.idEmpleado)
        .then(([rows, fieldData]) => {
            const currentDate = new Date();
            const numeroDeResultados = rows.length;
            const numeroDePaginas = Math.ceil(numeroDeResultados / resultadosPorPagina);
            const page = request.query.page ? Number(request.query.page) : 1;
            if (numeroDeResultados > 0){
                if (page > numeroDePaginas) {
                    response.redirect('vacaciones/estatus_mis_vacaciones/?page=' + encodeURIComponent(numeroDePaginas));
                } else if (page < 1) {
                    response.redirect('vacaciones/estatus_mis_vacaciones/?page=' + encodeURIComponent('1'));
                }
            }
            const inicioLimite = (page - 1) * resultadosPorPagina;
            Solicitudes.fetchLider(request.session.empleado.idEmpleado)
                .then(([rows, fieldData]) => {
                    const lider = rows[0];
                    const flag = '';
                    Solicitudes.fetchPaginacionMisVacaciones(request.session.empleado.idEmpleado, inicioLimite, resultadosPorPagina)
                    .then(([rows, fieldData]) => {
                        let iterator = (page - 2) < 1 ? 1 : page - 2;
                        const paginaFinal = (iterator + 4) <= numeroDePaginas ? (iterator + 4) : numeroDePaginas;
                        if ((page + 2) > numeroDePaginas && (page - 2) > 1) {
                            iterator = numeroDePaginas - 4;
                        }
                        response.render('vacaciones/estatusMisVacaciones', {
                            sesion: request.session.empleado,
                            rol: request.session.rol,
                            privilegios: request.session.privilegios,
                            solicitudes: rows, page, iterator, paginaFinal, numeroDePaginas,
                            lider: lider,
                            diaActual: currentDate,
                            flag: flag
                        });
                    })
                    .catch((error) => {
                        console.log(error);
                    })
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

    Solicitudes.fetchVacacionesRestantes(request.session.empleado.idEmpleado)
    .then(([rows,fieldData]) => {
        const vacacionesRestantes = rows[0].vacacionesTotalesAux;

        //Condiciones a cumplir para registro de solicitud de vacación exitosa
        const check1 = request.body.fechaInicio <= fechaSolicitud;
        const check1_1 = fechaInicio.getUTCDay() == 0 || fechaInicio.getUTCDay() == 6;
        const check2 = request.body.fechaFin < request.body.fechaInicio;
        const check2_2 = fechaFin.getUTCDay() == 0 || fechaFin.getUTCDay() == 6;
        const check3 = vacacionesPedidas > vacacionesRestantes;
        const check4 = request.body.fechaReanudacion <= fechaSolicitud || request.body.fechaReanudacion <= request.body.fechaInicio || request.body.fechaReanudacion <= request.body.fechaFin;
        const check4_4 = fechaReanudacion.getUTCDay() == 0 || fechaReanudacion.getUTCDay() == 6;
        const flag = check1 ? 'FII' : check1_1 ? 'FISB' : check2 ? 'FFI' : check2_2 ? 'FFSB' : check3 ? 'NVI' : check4 ? 'FRI' : check4_4 ? 'FRSB' : 'success';

        if (flag == 'success') {
            vacacion.saveSolicitud(vacacionesPedidas)
                .then(() => {
                    response.render('vacaciones/nuevaSolicitudVacacion', {
                        sesion: request.session.empleado,
                        vacacionesRestantes: (vacacionesRestantes - vacacionesPedidas),
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
                vacacionesRestantes: vacacionesRestantes,
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
    })
    .catch((error) => {
        console.log(error);
    });

};

exports.estatusVacaciones = (request, response, next) => {
    Solicitudes.fetchAllVacaciones().then(([rows, fieldData]) => {
        const data = rows;
        const monar = '';
        const numeroDeResultados = rows.length;
        const numeroDePaginas = Math.ceil(numeroDeResultados / resultadosPorPagina);
        const page = request.query.page ? Number(request.query.page) : 1;
        // console.log(page);
        if (numeroDeResultados > 0) {
            if (page > numeroDePaginas) {
                response.redirect('vacaciones/solicitudes_estatus_vacaciones/?page='+encodeURIComponent(numeroDePaginas));
            } else if (page < 1) {
                response.redirect('vacaciones/solicitudes_estatus_vacaciones/?page='+encodeURIComponent('1'));
            }
        }
        const inicioLimite = (page - 1) * resultadosPorPagina;
        Solicitudes.fetchAreas()
            .then(([areas, fieldData]) => {
                const data = rows;
                var ws = fs.createWriteStream('public/Solicitudes.csv');
                fastcsv
                    .write(data, {headers:true})
                    .on('finish', function() {
                        Solicitudes.fetchPaginacionAllVacaciones(inicioLimite, resultadosPorPagina)
                        .then(([rows,fieldData]) => {
                            let iterator = (page - 2) < 1 ? 1 : page - 2;
                            const paginaFinal = (iterator + 4) <= numeroDePaginas ? (iterator + 4) : numeroDePaginas;
                            if ((page + 2) > numeroDePaginas && (page - 2) > 1) {
                                iterator = numeroDePaginas - 4;
                            }
                            response.render('vacaciones/estatusVacaciones', {
                                sesion: request.session.empleado,
                                rol: request.session.rol,
                                privilegios: request.session.privilegios,
                                solicitudes: rows, page, iterator, paginaFinal, numeroDePaginas,
                                areas: areas,
                                monar: monar
                            });
                        })
                        .catch((error) => {
                            console.log(error);
                        })
                        
                    }).pipe(ws);
            })
            .catch((error) => {
                console.log(error);
            });
        }).catch((error) => {
            console.log(error);
        });
};

// Funcion Filtrar solicitudes de vacaciones por Mes y Área
exports.filtraSolVacaciones = (request, response, next) => {
    // Variable correspondiente a mes o area
    const monar = request.params.mesar = '' ? '' : request.params.mesar;

    const meses = ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"];

    let index_mes = meses.indexOf(monar) + 1;

    // Variable que obtiene el año actual
    const y = new Date();
    let year = y.getFullYear();

    Solicitudes.filtraSolVacacionesMes(year, index_mes, monar)
        .then(([rows, fieldData]) => {
            const numeroDeResultados = rows.length;
            const numeroDePaginas = Math.ceil(numeroDeResultados / resultadosPorPagina);
            const page = request.query.page ? Number(request.query.page) : 1;
            if (numeroDeResultados > 0) {
                if (page > numeroDePaginas) {
                    response.redirect('vacaciones/solicitudes_estatus_vacaciones/' + monar + '/?page='+ encodeURIComponent(numeroDePaginas));
                } else if (page < 1) {
                    response.redirect('vacaciones/solicitudes_estatus_vacaciones/' + monar + '/?page='+ encodeURIComponent('1'));
                }
            }
            const inicioLimite = (page - 1) * resultadosPorPagina;
            Solicitudes.fetchAreas()
                .then(([areas, fieldData]) => {
                    Solicitudes.filtraPaginacionSolVacacionesMes(year, index_mes, monar, inicioLimite, resultadosPorPagina)
                    .then(([rows, fieldData]) => {
                        let iterator = (page - 2) < 1 ? 1 : page - 2;
                        const paginaFinal = (iterator + 4) <= numeroDePaginas ? (iterator + 4) : numeroDePaginas;
                            if ((page + 2) > numeroDePaginas && (page - 2) > 1) {
                                iterator = numeroDePaginas - 4;
                        }
                        response.render('vacaciones/estatusVacaciones', {
                            sesion: request.session.empleado,
                            rol: request.session.rol,
                            privilegios: request.session.privilegios,
                            solicitudes: rows, page, iterator, paginaFinal, numeroDePaginas,
                            monar: monar,
                            areas: areas
                    });
                        })
                    .catch((error) => {
                        console.log(error);
                    })
        });
    }).catch((error) => {
        console.log(error);
    });
};


