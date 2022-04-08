exports.vistaGeneral = (request, response, next) => {
    console.log(request.body);
    response.render('generalAdmin');
    console.log(request.session.empleado);
    console.log(request.session.rol);
    console.log(request.session.privilegios)
};
