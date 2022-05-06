const Empleado = require('../models/models_empleados');

exports.perfil = (request, response, next) => {
    console.log(request.body);
    Empleado.fetchTel(request.session.empleado.idEmpleado)
    .then((rows, fieldData) => {
        const numTelefono = rows[0][0].numTelefonico;
        response.render('perfil/vistaPerfil',{
            sesion: request.session.empleado,
            rol: request.session.rol,
            privilegios: request.session.privilegios,
            telefono: numTelefono
        });
    })
    .catch();

};

exports.guardarNumTelefono = (request, response, next) =>{
    console.log(request.body.numTelefono);
    Empleado.saveTel(request.session.empleado.idEmpleado, request.body.numTelefono)
    .then(() => {
        response.redirect('/perfil');
    })
    .catch((error) => {
        console.log(error);
    });
};