exports.reportes = (request, response, next) => {
    console.log(request.body);
    console.log("Reportes");
    response.render('reportes/reportesAdmin',{
        sesion: request.session.empleado,
        rol: request.session.rol,
        privilegios: request.session.privilegios
    });
};

exports.nuevo_reporte = (request, response, next) => {
    console.log("Nuevo Reporte");
    response.render('reportes/crearReporte',{
        sesion: request.session.empleado,
        rol: request.session.rol,
        privilegios: request.session.privilegios
    });
};

exports.modificar_reporte = (request, response, next) => {
    console.log("Modificar Reporte");
    response.render('reportes/modificarReporte',{
        sesion: request.session.empleado,
        rol: request.session.rol,
        privilegios: request.session.privilegios
    });
};