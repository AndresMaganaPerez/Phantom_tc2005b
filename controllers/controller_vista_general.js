exports.vistaGeneral = (request, response, next) => {
    console.log(request.body);
    console.log(request.session.empleado);
    console.log(request.session.rol);
    console.log(request.session.privilegios);
    response.render('general/general', {
        sesion: request.session.empleado,
        rol: request.session.rol,
        privilegios: request.session.privilegios
    });

};
