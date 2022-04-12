const NGB = require('../models/models_natgasBlock')

var currentdate = new Date(); //ESTO TE DA LA FECHA ACTUAL
var datetime = currentdate.getDate() + "/"
                + (currentdate.getMonth()+1)  + "/" 
                + currentdate.getFullYear()

exports.solicitarNatgasBlock = (request, response, next) => {
    console.log(request.body);
    console.log("Solicitar mi Natgas Block");
    NGB.getUltimaSolcitud(request.session.empleado.idEmpleado)
    .then(([rows,fieldData]) =>{
        const ultimoNGB = rows[0].fechaSolicitud
    response.render('natgasBlock/nuevaSolicitudNGB', {
        sesion: request.session.empleado,
        rol: request.session.rol,
        privilegios: request.session.privilegios,
        restantes: request.session.empleado.cantidadNatgasBlocks,
        fechaDeHoy: datetime,
        ultimoNGB: ultimoNGB
    })
    }).catch(err =>{console.log(err)})
    
};
exports.postDeSolicitud = (request,response,next) => {
    const ngb = new NGB(request.session.empleado.idEmpleado,request.body.fecha)
    ngb.save_NGB()
    .then(() =>{
        response.redirect('/general')
    }).catch(err=>{console.log(err)})
}

exports.solicitudesAceptarNatgasBlock = (request, response, next) => {
    NGB.getNGBDeMisEmpleados(request.session.empleado.idEmpleado)
    .then(([rows,fieldData]) =>{
        console.log(request.body);
        console.log("Solicitudes para Aceptar de Natgas block");
        response.render('natgasBlock/aceptarEstatusSolicitudesNGB', {
            ngbsPorAceptar: rows,
            sesion: request.session.empleado,
            rol: request.session.rol,
            privilegios: request.session.privilegios
        });
    }).catch(err =>{console.log(err)})

};

exports.solicitudesEstatusNatgasBlock = (request, response, next) => {
        console.log("Consultar Solicitudes NGB");
    response.render('natgasBlock/estatusSolicitudesNGB', {
        sesion: request.session.empleado,
        rol: request.session.rol,
        privilegios: request.session.privilegios
    });   
};