const { borrarSolicitud } = require('../models/models_vacaciones');
const Solicitudes = require('../models/models_vacaciones');


exports.solicitarVacaciones = (request, response, next) => {
    console.log(request.body);
    console.log("solicitar mis Vacaciones");
    response.render('vacaciones/nuevaSolicitudDespachador',{
        sesion: request.session.empleado,
        rol: request.session.rol,
        privilegios: request.session.privilegios
    });
};

exports.solicitudesVacaciones = (request, response, next) => {
    response.render('vacaciones/consultarSolicitudesVacacionesLider',{
        sesion: request.session.empleado,
        rol: request.session.rol,
        privilegios: request.session.privilegios,
    });
}

exports.postSolicitarVacaciones = (request, response, next) => {
    const vacacion = new Solicitudes(90954, request.body.fechaInicio, request.body.fechaFin, request.body.suplente);
    vacacion.saveSolicitud()
    .then(() => {
        response.redirect('vacaciones/solicitudes_vacaciones/');
    })
    .catch((error) => {
        console.log(error);
    });
};

exports.solicitudesMisVacaciones = (request, response, next) => {
    //console.log(request.body);
    Solicitudes.fetchAll(90954).then(([rows, fieldData]) => {
        console.log(rows);
        response.render('vacaciones/estatusVacacionesDespachador', {
            sesion: request.session.empleado,
            rol: request.session.rol,
            privilegios: request.session.privilegios,
            solicitudes: rows
        });
    }).catch((error) => {
        console.log(error);
    });

};

exports.cancelarSolicitud = (request, response, next) => {
    borrarSolicitud(request.session.empleado.idEmpleado)
}
