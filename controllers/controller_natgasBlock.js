const NGB = require('../models/models_natgasBlock')

exports.solicitarNatgasBlock = (request, response, next) => {
    console.log(request.body);
    console.log("Solicitar mi Natgas Block");
    response.render('natgasBlock/nuevaSolicitudNGBLider',{
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

exports.solicitudesNatgasBlock = (request, response, next) => {
    console.log(request.body);
    console.log("Solicitudes de Natgas block");
    response.render('natgasBlock/consultarSolicitudesNGBLider', {
        sesion: request.session.empleado,
        rol: request.session.rol,
        privilegios: request.session.privilegios
    });
};