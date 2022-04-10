exports.vistaGeneral = (request, response, next) => {
    console.log(request.body);
    response.render('generalPromJF');
    console.log(request.session.empleado);
    console.log(request.session.rol.descripcionRol);
    console.log(request.session.privilegios);
};
