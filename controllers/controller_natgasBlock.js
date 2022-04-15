const NGB = require('../models/models_natgasBlock');

var currentdate = new Date(); //ESTO TE DA LA FECHA ACTUAL
var datetime = currentdate.getDate() + "/"
                + (currentdate.getMonth()+1)  + "/" 
                + currentdate.getFullYear()

exports.solicitarNatgasBlock = (request, response, next) => {
    console.log(request.body);
    console.log("Solicitar mi Natgas Block");
    NGB.getUltimaSolcitud(request.session.empleado.idEmpleado)
    .then(([rows,fieldData]) =>{
        if(rows.length >= 1) {
            const ultimoNGB = rows[0].fechaSolicitud
            response.render('natgasBlock/nuevaSolicitudNGB', {
                sesion: request.session.empleado,
                rol: request.session.rol,
                privilegios: request.session.privilegios,
                restantes: request.session.empleado.cantidadNatgasBlocks,
                fechaDeHoy: datetime,
                ultimoNGB: ultimoNGB.toString().substr(0,15)
            })
        } else{
            const ultimoNGB = "No has solicitado ningun Natgas Block."
            response.render('natgasBlock/nuevaSolicitudNGB', {
                sesion: request.session.empleado,
                rol: request.session.rol,
                privilegios: request.session.privilegios,
                restantes: request.session.empleado.cantidadNatgasBlocks,
                fechaDeHoy: datetime,
                ultimoNGB: ultimoNGB
            })
        }
        //console.log(rows);
    }).catch((err) =>{console.log(err)})
    
};
exports.postDeSolicitud = (request,response,next) => {
    const ngb = new NGB(request.session.empleado.idEmpleado,request.body.fecha)
    ngb.save_NGB()
    .then(() =>{
        response.redirect('/general')
    }).catch(err=>{console.log(err)})
}

exports.solicitudesAceptarNatgasBlock = (request, response, next) => {
    NGB.fetchNGBPorAceptar(request.session.empleado.idEmpleado).then(([rows, fieldData]) => {
        console.log("NGBS POR ACEPTAR CON NOMBRES");
        console.log(rows);
        response.render('natgasBlock/aceptarEstatusSolicitudesNGB', {
            ngbsPorAceptar: rows,
            sesion: request.session.empleado,
            rol: request.session.rol,
            privilegios: request.session.privilegios
        });
    }).catch((err) => {
        console.log(err);
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

exports.aceptarNGB = (request, response, next) => {
    console.log("LE DIO CLICK AL BOTON de Aceptar");
    console.log(request.body.aceptado);
    console.log(request.body.idngb);
    NGB.aceptarNGB(request.body.idqs, request.body.idngb).then(([rows, fieldData]) => {
        response.redirect('/natgas_blocks/solicitudes_natgas_block')
    }).catch((error) => {
        console.log(error);
    });

};

// Funcion Filtrar solicitudes de NGB por Mes
exports.filtraSolNGBMes = (request, response, next) => {
    console.log("Filtrando NGB");
    const month = request.params.mes;
    NGB.filtraSolNGBMes(month).then(([rows, fieldData]) => {
        response.render('natgasBlock/estatusSolicitudesNGB', {
            sesion: request.session.empleado,
            rol: request.session.rol,
            privilegios: request.session.privilegios,
            solicitudes: rows,
        });
    }).catch((error) => {
        console.log(error);
    });

};