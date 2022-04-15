exports.perfil = (request, response, next) => {
    console.log(request.body);
    response.render('perfil/vistaPerfil',{
        sesion: request.session.empleado,
        rol: request.session.rol,
        privilegios: request.session.privilegios
    });
};