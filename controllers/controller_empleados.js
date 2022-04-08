const empleados = require('../models/models_empleados');
const bcrypt = require('bcryptjs');

exports.login_Signup = (request, response, next) => {
    response.render('signIn');
};

exports.postSignUp = (request, response, next) => {
    const nuevoEmpleado = new empleados(request.body.nomina, request.body.email, request.body.password, request.body.nombre, request.body.apellidoP, request.body.apellidoM,request.body.fechaNac, request.body.telefono)
};