const empleados = require('../models/models_empleados');
const bcrypt = require('bcryptjs');

exports.signup = (request, response, next) => {
    response.render('signIn');
};

exports.getLogin = (request, response, next) => {
    response.render('signIn');
};

exports.postSignUp = (request, response, next) => {
    const nuevoEmpleado = new empleados(request.body.nomina, request.body.email, request.body.password, request.body.nombre, request.body.apellidoP, request.body.apellidoM,request.body.fechaNac, request.body.telefono);
    nuevoEmpleado.save_empleado()
    .then(() => {
        response.redirect('/');
    })
    .catch((err) => {
        console.log(err);
    });
};

exports.login = (request, response, next) => {
    empleados.findEmpleado(request.body.email_login)
    .then(([rows, fieldData]) => {
        if (rows.length < 1) {
            return response.redirect('/');
        }
        const empleado = new empleados(rows[0].idEmpleado, rows[0].email, rows[0].token, rows[0].nombre, rows[0].apellidoPaterno, rows[0].apellidoMaterno, rows[0].fechaNac, rows[0].numTelefonico);
        bcrypt.compare(request.body.password_login, empleado.token)
            .then((doMatch) => {
                if (doMatch) {
                    request.session.isLoggedIn = true;
                    request.session.empleado = empleado;
                    return request.session.save(err => {
                        response.redirect('/general');
                    });
                }
                response.redirect('/');
            })
            .catch((error) => {
                console.log(error);
                response.redirect('/');
            });
    })
    .catch((error) => {
        console.log(error);
    })
}

exports.logout = (request,response,next) => {
    request.session.destroy(() => {
        response.redirect('/');
    })
}