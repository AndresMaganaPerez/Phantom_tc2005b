const Solicitudes = require('../models/models_vacaciones');


exports.solicitarVacaciones = (request, response, next) => {
    console.log(request.body);
    console.log("solicitar mis Vacaciones");
    response.render('nuevaSolicitudDespachador')
};

exports.postSolicitarVacaciones = (request, response, next) => {
    const vacacion = new Solicitudes(request.body.fechaInicio, request.body.fechaFin, request.body.suplente);
    vacacion.saveSolicitud()   
    .then(() => {
        response.redirect('/vacaciones/solicitudes_vacaciones/');
    })
    .catch((error) => {
        console.log(error);
    });
};

exports.solicitudesVacaciones = (request, response, next) => {
    console.log(request.bodys);
    console.log("Solicitudes de vacaciones");
    response.render('consultarSolicitudesVacacionesLider');
};
