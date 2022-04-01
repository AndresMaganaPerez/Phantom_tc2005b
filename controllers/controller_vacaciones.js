exports.solicitarVacaciones = (request, response, next) => {
    console.log(request.body);
    console.log("solicitar mis Vacaciones");
};

exports.solicitudesVacaciones = (request, response, next) => {
    console.log(request.body);
    console.log("Solicitudes de vacaciones");
    response.render('anunciosAdmin');
};
