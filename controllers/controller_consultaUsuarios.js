const { borrarEmpleado } = require('../models/models_empleados')
const empleados = require('../models/models_empleados')

exports.usuarios = (request,response,next) =>{
    empleados.fetchEmpleadoYRol()
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

exports.buscarUsuario = (request, response, next) => {
    empleados.fetchEmpleado(request.params.criterio)
    .then(([rows,FieldData]) => {
        response.status(200).json(rows);
    }).catch(error =>{console.log(error);})
}

exports.borrarUsuario = (request, response, next) => {
    const id = request.body.delete
    console.log(id)
    borrarEmpleado(id)
    .then(() => {
        response.redirect('/usuarios')  
    })
    .catch((err) => {
        console.log(err)
    })

}