exports.reportes = (request, response, next) => {
    console.log(request.body);
    console.log("Reportes");
    response.render('reportesAdmin');
};

exports.nuevo_reporte = (request, response, next) => {
    console.log("Nuevo Reporte");
    response.render('crearReporte');
};

exports.modificar_reporte = (request, response, next) => {
    console.log("Modificar Reporte");
    response.render('modificarReporte');
};