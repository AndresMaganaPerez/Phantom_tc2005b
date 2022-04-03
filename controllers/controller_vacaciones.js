const Solicitudes = require('../models/models_vacaciones');


exports.solicitarVacaciones = (request, response, next) => {
    console.log(request.body);
    console.log("solicitar mis Vacaciones");
    response.render('nuevaSolicitudDespachador');
};

exports.postSolicitarVacaciones = (request, response, next) => {
    const vacacion = new Solicitudes(90954, request.body.fechaInicio, request.body.fechaFin, request.body.suplente);
    vacacion.saveSolicitud()
    .then(() => {
        response.redirect('/vacaciones/solicitudes_vacaciones/');
    })
    .catch((error) => {
        console.log(error);
    });
};

exports.solicitudesVacaciones = (request, response, next) => {
    console.log(request.body);
    Solicitudes.fetchAll(90954).then(([rows, fieldData]) => {
        console.log(rows);
        response.render('estatusVacacionesDespachador', {
            solicitudes: rows
        });
    }).catch((error) => {
        console.log(error);
    });

};