const NGB = require('../models/models_natgasBlock');

const currentdate = new Date(); //ESTO TE DA LA FECHA ACTUAL
const datetime = currentdate.getDate() + "/"
                + (currentdate.getMonth()+1)  + "/" 
                + currentdate.getFullYear();

const resultadosPorPagina = 10;

exports.solicitarNatgasBlock = (request, response, next) => {
    console.log(request.body);
    console.log("Solicitar mi Natgas Block");
    NGB.getUltimaSolcitud(request.session.empleado.idEmpleado)
    .then(([rows,fieldData]) =>{
        const fechaUltimaSolicitud = rows.length > 0 ? new Date(rows[0].fechaSolicitud) : '';
        const ultimoNGB = rows.length < 1 ? " No has solicitado ningún Natgas Block" : new Date(rows[0].fechaSolicitud);
        const condicionUltimoNGB = ultimoNGB instanceof Date ? ultimoNGB.getDate() + "/" + (ultimoNGB.getMonth() + 1) + "/" + ultimoNGB.getFullYear() : ultimoNGB; 
        const limiteFechaNGB = fechaUltimaSolicitud == '' ? '' : (currentdate.getMonth() + 1) != (fechaUltimaSolicitud.getMonth() + 1) ? 'pass' : 'invalid';
        const flag = '';
        response.render('natgasBlock/nuevaSolicitudNGB', {
            sesion: request.session.empleado,
            rol: request.session.rol,
            privilegios: request.session.privilegios,
            restantes: request.session.empleado.cantidadNatgasBlocks,
            fechaDeHoy: datetime,
            ultimoNGB: condicionUltimoNGB,
            limiteFecha : limiteFechaNGB,
            flag: flag,
        });
        //console.log(rows);
    }).catch((err) =>{console.log(err)});
    
};

exports.postDeSolicitud = (request,response,next) => {
    const fechaUso = new Date(request.body.fecha);
    const flag = fechaUso.getUTCDay() == 0 || fechaUso.getUTCDay() == 6 ? 'FUSB' : 'success';
    if (flag == 'success'){
        const ngb = new NGB(request.session.empleado.idEmpleado,request.body.fecha);
        ngb.save_NGB()
        .then(() => {
            NGB.getUltimaSolcitud(request.session.empleado.idEmpleado)
            .then(([rows,fieldData]) =>{
                const fechaUltimaSolicitud = rows.length > 0 ? new Date(rows[0].fechaSolicitud) : '';
                const ultimoNGB = rows.length < 1 ? " No has solicitado ningún Natgas Block" : new Date(rows[0].fechaSolicitud);
                const condicionUltimoNGB = ultimoNGB instanceof Date ? ultimoNGB.getDate() + "/" + (ultimoNGB.getMonth() + 1) + "/" + ultimoNGB.getFullYear() : ultimoNGB; 
                const limiteFechaNGB = fechaUltimaSolicitud == '' ? '' : (currentdate.getMonth() + 1) != (fechaUltimaSolicitud.getMonth() + 1) ? 'pass' : 'invalid';
                response.render('natgasBlock/nuevaSolicitudNGB', {
                    sesion: request.session.empleado,
                    rol: request.session.rol,
                    privilegios: request.session.privilegios,
                    restantes: request.session.empleado.cantidadNatgasBlocks,
                    fechaDeHoy: datetime,
                    ultimoNGB: condicionUltimoNGB,
                    limiteFecha : limiteFechaNGB,
                    flag: flag
                });
            }).catch((error) => {
                console.log(error);
            });

        }).catch((err) => {
            console.log(err);
        });
    } else{
        NGB.getUltimaSolcitud(request.session.empleado.idEmpleado)
        .then(([rows,fieldData]) =>{
            const fechaUltimaSolicitud = rows.length > 0 ? new Date(rows[0].fechaSolicitud) : '';
            const ultimoNGB = rows.length < 1 ? " No has solicitado ningún Natgas Block" : new Date(rows[0].fechaSolicitud);
            const condicionUltimoNGB = ultimoNGB instanceof Date ? ultimoNGB.getDate() + "/" + (ultimoNGB.getMonth() + 1) + "/" + ultimoNGB.getFullYear() : ultimoNGB; 
            const limiteFechaNGB = fechaUltimaSolicitud == '' ? '' : (currentdate.getMonth() + 1) != (fechaUltimaSolicitud.getMonth() + 1) ? 'pass' : 'invalid';
            const ngbRegistrado = '';
            response.render('natgasBlock/nuevaSolicitudNGB', {
                sesion: request.session.empleado,
                rol: request.session.rol,
                privilegios: request.session.privilegios,
                restantes: request.session.empleado.cantidadNatgasBlocks,
                fechaDeHoy: datetime,
                ultimoNGB: condicionUltimoNGB,
                limiteFecha : limiteFechaNGB,
                fechaUso: request.body.fecha,
                flag: flag
            });
        }).catch((error) => {
            console.log(error);
        });
    }
};

exports.solicitudesAceptarNatgasBlock = (request, response, next) => {
    NGB.fetchNGBPorAceptar(request.session.empleado.idEmpleado).then(([rows, fieldData]) => {
        const flag = '';
        response.render('natgasBlock/aceptarEstatusSolicitudesNGB', {
            ngbsPorAceptar: rows,
            sesion: request.session.empleado,
            rol: request.session.rol,
            privilegios: request.session.privilegios,
            flag: flag
        });
    }).catch((err) => {
        console.log(err);
    });
};

exports.solicitudesEstatusNatgasBlock = (request, response, next) => {
    console.log("Consultar Solicitudes NGB");
    NGB.fetchAreas()
    .then(([areas, fieldData]) => {
        NGB.fetchAll().then(([rows, fieldData]) => {
            const numeroDeResultados = rows.length;
            const numeroDePaginas = Math.ceil(numeroDeResultados / resultadosPorPagina);
            const page = request.query.page ? Number(request.query.page) : 1;
            if (numeroDeResultados > 0){
                if (page > numeroDePaginas) {
                    response.redirect('natgas_blocks/solicitudes_estatus_natgas_block/?page=' + encodeURIComponent(numeroDePaginas));
                } else if (page < 1) {
                    response.redirect('natgas_blocks/solicitudes_estatus_natgas_block/?page=' + encodeURIComponent('1'));
                }
            }    
            const inicioLimite = (page - 1) * resultadosPorPagina;
            NGB.fetchPaginacionAll(inicioLimite, resultadosPorPagina)
            .then(([rows, fieldData]) => {
                const monar = '';
                let iterator = (page - 2) < 1 ? 1 : page - 2;
                const paginaFinal = (iterator + 4) <= numeroDePaginas ? (iterator + 4) : numeroDePaginas;
                if ((page + 2) > numeroDePaginas && (page - 2) > 1) {
                    iterator = numeroDePaginas - 4;
                }
                response.render('natgasBlock/estatusSolicitudesNGB', {
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
        }).catch((error) => {
            console.log(error);
        });
    })
    .catch((error) => {
        console.log(error);
    })
};

exports.aceptarNGB = (request, response, next) => {
    const flag = 'ngbAceptada';
    NGB.getNGBInfo(request.body.idngb)
    .then(([ngb,fieldData]) => {
        const infoNGB = ngb[0];
        NGB.aceptarNGB(request.body.idqs, request.body.idngb)
        .then(() => {
            NGB.fetchNGBPorAceptar(request.session.empleado.idEmpleado)
            .then(([rows, fieldData]) => {
                response.render('natgasBlock/aceptarEstatusSolicitudesNGB', {
                    ngbsPorAceptar: rows,
                    sesion: request.session.empleado,
                    rol: request.session.rol,
                    privilegios: request.session.privilegios,
                    infoNGB: infoNGB,
                    flag: flag                    
                });
            }).catch((err) => {
                console.log(err);
            });
        }).catch((error) => {
            console.log(error);
        });
    })
    .catch((error) => {
        console.log(error);
    })
};

// Funcion Filtrar solicitudes de NGB por Mes
exports.filtraSolNGBMes = (request, response, next) => {
    // Variable correspondiente a mes o area
    const monar = request.params.mesar;

    const meses = ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"];

    let index_mes = meses.indexOf(monar) + 1;

    // Variable que obtiene el año actual
    const currentDate = new Date();
    let year = currentDate.getFullYear();
    
    NGB.filtraSolNGBMesAr(year, index_mes, monar).then(([rows, fieldData]) => {
        const numeroDeResultados = rows.length;
        const numeroDePaginas = Math.ceil(numeroDeResultados / resultadosPorPagina);
        const page = request.query.page ? Number(request.query.page) : 1;
        if(numeroDeResultados > 0) {
            if (page > numeroDePaginas) {
                response.redirect('/natgas_blocks/solicitudes_natgas_block/' + monar + '/?page=' + encodeURIComponent(numeroDePaginas));
            } else if (page < 1) {
                response.redirect('/natgas_blocks/solicitudes_natgas_block/' + monar + '/?page=' + encodeURIComponent('1'));
            }
        }
        const inicioLimite = (page - 1) * resultadosPorPagina;
        NGB.fetchAreas()
        .then(([areas, fieldData]) => {
            NGB.filtraPaginacionSolNGBMesAr(year, index_mes, monar, inicioLimite, resultadosPorPagina)
            .then(([rows, fieldData]) => {
                let iterator = (page - 2) < 1? 1: page - 2;
                const paginaFinal = (iterator + 4) <= numeroDePaginas ? (iterator + 4) : numeroDePaginas;
                if ((page + 2) > numeroDePaginas && (page - 2) > 1) {
                    iterator = numeroDePaginas - 4;
                }
                response.render('natgasBlock/estatusSolicitudesNGB', {
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
        })
        .catch((error) => {
            console.log(error);
        })
    }).catch((error) => {
        console.log(error);
    });

};