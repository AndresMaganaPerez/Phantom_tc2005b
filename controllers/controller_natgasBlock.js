exports.solicitarNatgasBlock = (request, response, next) => {
    console.log(request.body);
    console.log("Solicitar mi Natgas Block");
    response.render('nuevaSolicitudNGBOperador')
};

exports.solicitudesNatgasBlock = (request, response, next) => {
    console.log(request.body);
    console.log("Solicitudes de Natgas block");
    response.render('consultarSolicitudesNGBAdmin');
};