exports.solicitarNatgasBlock = (request, response, next) => {
    console.log(request.body);
    console.log("Solicitar mi Natgas Block");
    response.render('natgasBlock/nuevaSolicitudNGB', {
        sesion: request.session.empleado,
        rol: request.session.rol,
        privilegios: request.session.privilegios
    });
};

exports.solicitudesAceptarNatgasBlock = (request, response, next) => {
    console.log(request.body);
    console.log("Solicitudes para Aceptar de Natgas block");
    response.render('natgasBlock/aceptarEstatusSolicitudesNGB', {
        sesion: request.session.empleado,
        rol: request.session.rol,
        privilegios: request.session.privilegios
    });

};

exports.solicitudesEstatusNatgasBlock = (request, response, next) => {
    console.log("Consultar Solicitudes NGB");
    response.render('natgasBlock/estatusSolicitudesNGB', {
        sesion: request.session.empleado,
        rol: request.session.rol,
        privilegios: request.session.privilegios
    });
};