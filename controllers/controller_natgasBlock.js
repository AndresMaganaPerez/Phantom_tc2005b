const NGB = require('../models/models_natgasBlock')

exports.solicitarNatgasBlock = (request, response, next) => {
    console.log(request.body);
    console.log("Solicitar mi Natgas Block");
    response.render('natgasBlock/nuevaSolicitudNGB', {
        sesion: request.session.empleado,
        rol: request.session.rol,
        privilegios: request.session.privilegios,
        restantes: request.session.empleado.cantidadNatgasBlocks

    })
};
exports.postDeSolicitud = (request,response,next) => {
    const ngb = new NGB(request.session.empleado.idEmpleado,request.body.fecha)
    ngb.save_NGB()
    .then(() =>{
        response.redirect('/general')
    }).catch(err=>{console.log(err)})
}

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

    NGB.fetchAll().then(([rows, fieldData]) => {
        console.log("Mostrando la tabla que necesito")
        console.log(rows);
        response.render('natgasBlock/estatusSolicitudesNGB', {
            sesion: request.session.empleado,
            rol: request.session.rol,
            privilegios: request.session.privilegios,
            solicitudes: rows,
        })
    }).catch((error) => {
        console.log(error);
    });


};