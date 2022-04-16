const empleados = require('../models/models_empleados')

exports.usuarios = (request,response,next) =>{
    empleados.fetchAll()
    .then(([rows,fieldData]) =>{
        if(rows.length >= 1){
            response.render('consultaUsuarios/consultaDeEmpleados', {
                sesion: request.session.empleado,
                rol: request.session.rol,
                privilegios: request.session.privilegios,
                empleados: rows
            })
        } else{
            response.render('consultaUsuarios/consultaDeEmpleados', {
                sesion: request.session.empleado,
                rol: request.session.rol,
                privilegios: request.session.privilegios,
                empleados: "No existen empleados registrados."
            })
        }
    })
}