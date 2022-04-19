const empleados = require('../models/models_empleados');
const bcrypt = require('bcryptjs');

exports.signup = (request, response, next) => {
    response.render('signup_login/signIn', {
        flag: ''
    });
};

exports.getLogin = (request, response, next) => {
    response.render('signup_login/signIn', {
        flag: ''
    });
};

exports.postSignUp = (request, response, next) => {
    empleados.verificarNomina(request.body.nomina)
    .then(([nominas,fieldData]) => {
        if(nominas.length < 1){
            empleados.verificarEmail(request.body.email)
            .then(([emails,fieldData]) => {
                if (emails.length < 1){
                    const nuevoEmpleado = new empleados(request.body.nomina, request.body.email, request.body.password, request.body.nombre, request.body.apellidoP, request.body.apellidoM,request.body.fechaNac, request.body.telefono);
                    nuevoEmpleado.save_empleado()
                    .then(() => {
                        const flag = 'success';
                        response.render('signup_login/signIn',{
                            flag: flag
                        });
                    })
                    .catch((err) => {
                        console.log(err);
                    });
                } else {
                    const flag = 'EmailExiste';
                    response.render('signup_login/signIn',{
                        flag: flag,
                        nombre: request.body.nombre,
                        apellidoPat: request.body.apellidoP,
                        apellidoMat: request.body.apellidoM,
                        nomina: request.body.nomina,
                        fechaNac: request.body.fechaNac,
                        tel: request.body.telefono,
                        email: request.body.email
                    });
                    console.log('Existe email');
                }
            })
            .catch((error) => {
                console.log(error);
            })
        } else{
            const flag = 'NominaExiste';
            response.render('signup_login/signIn',{
                flag: flag,
                nombre: request.body.nombre,
                apellidoPat: request.body.apellidoP,
                apellidoMat: request.body.apellidoM,
                nomina: request.body.nomina,
                fechaNac: request.body.fechaNac,
                tel: request.body.telefono,
                email: request.body.email                
            });
            console.log('Existe nomina');
        }
    })
    .catch((error) => {
        console.log(error);
    })
};

exports.login = (request, response, next) => {
    empleados.findEmpleado(request.body.email_login)
    .then(([rows, fieldData]) => {
        if (rows.length < 1) {
            const flag = 'invalidCredentials';
            response.render('signup_login/signIn.ejs', {
                flag: flag
            });
        }
        const empleado = rows[0];
        empleados.getPassword(request.body.email_login)
        .then(([passw, fieldData]) => {
            bcrypt.compare(request.body.password_login, passw[0].token)
                .then((doMatch) => {
                    if (doMatch) {
                        request.session.isLoggedIn = true;
                        request.session.empleado = empleado;
                        empleados.findRol(empleado.idEmpleado)
                        .then((rows, fieldData) => {
                            request.session.rol = rows[0][0].descripcionRol;
                            empleados.findPrivilegio(request.session.rol)
                            .then((rows, fieldData) => {
                                const privilegios = [];
                                for (let privilegio of rows[0]){
                                    privilegios.push(privilegio.accion);
                                }
                                request.session.privilegios = privilegios;
                                response.redirect('/general');
                            }).catch((error) => {
                                console.log(error);
                            })
                        })
                        .catch((error) => {
                            console.log(error);
                        });
                        return request.session.save(err => {   
                        });
                    }
                    const flag = 'invalidCredentials';
                    response.render('signup_login/signIn.ejs', {
                        flag: flag
                    });
                })
                .catch((error) => {
                    console.log(error);
                    response.redirect('/');
                });
        })
        .catch((error) => {
            console.log(error);
        })
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

exports.registroEmpleados = (request, response, next) => {
    console.log("Registrar empleado a plataforma")
    response.render('empleados/aceptarEmpleados',{
        sesion: request.session.empleado,
        rol: request.session.rol,
        privilegios: request.session.privilegios,
    })
}

exports.empleadosExistentes = (request, response, next) => {
    console.log("Consultar empleados");
    response.render('empleados/empleadosExistentes.ejs');
}