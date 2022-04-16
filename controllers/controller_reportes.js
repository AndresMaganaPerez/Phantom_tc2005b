const Reportes = require('../models/models_reportes');

exports.reportes = (request, response, next) => {
    const month = ["01","02","03","04","05","06","07","08","09","10","11","12"];
    const d = new Date();
    let mes = month[d.getMonth()];

    const y = new Date();
    let year = d.getFullYear();

    Reportes.fetchAll(mes, year).then(([rows, fieldData]) => {
        console.log(rows);
        response.render('reportes/consultarReportes',{
            sesion: request.session.empleado,
            rol: request.session.rol,
            privilegios: request.session.privilegios,
            indicadores: rows
        });
    }).catch(err => {
        console.log(err)
    });
    console.log("Reportes");
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