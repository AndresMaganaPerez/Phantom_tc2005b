exports.solicitarNatgasBlock = (request, response, next) => {
    console.log(request.body);
    console.log("Solicitar mi Natgas Block");
    response.render('natgasBlock/nuevaSolicitudNGBLider',{
        sesion: request.session.empleado,
        rol: request.session.rol,
        privilegios: request.session.privilegios
    })
};

exports.solicitudesNatgasBlock = (request, response, next) => {
    console.log(request.body);
    console.log("Solicitudes de Natgas block");
    response.render('natgasBlock/consultarSolicitudesNGBLider', {
        sesion: request.session.empleado,
        rol: request.session.rol,
        privilegios: request.session.privilegios
    });
};