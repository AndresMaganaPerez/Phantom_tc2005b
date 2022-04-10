exports.reportes = (request, response, next) => {
    console.log(request.body);
    console.log("Reportes");
    response.render('consultarReportes');
};

exports.nuevo_reporte = (request, response, next) => {
    console.log("Nuevo Reporte");
    response.render('crearReporte');
}

exports.nuevo_reporte = (request, response, next) => {
    console.log("Modificar Reporte");
    response.render('modificarReporte');
}