const empleados = require('../models/models_empleados');
const bcrypt = require('bcryptjs');
const { parse } = require('fast-csv');
const { findLider } = require('../models/models_empleados');
const nodemailer = require('nodemailer');
const noReplyJSON = require('../no_reply_email.json');

const transporter = nodemailer.createTransport({
    service: "hotmail",
    auth: {
        user: noReplyJSON.email,
        pass: noReplyJSON.password
    }
});

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
    .then(([nominas, fieldData]) => {
        if (nominas.length < 1) {
            empleados.verificarEmail(request.body.email)
            .then(([emails, fieldData]) => {
                if (emails.length < 1) {
                    empleados.verificarNominaAux(request.body.nomina)
                    .then(([nominaAux, fieldData]) => {
                        if (nominaAux.length < 1) {
                            empleados.verificarEmailAux(request.body.email)
                            .then(([emailAux, fieldData]) => {
                                if (emailAux.length < 1) {
                                    const nuevoEmpleado = new empleados(request.body.nomina, request.body.email, request.body.password, request.body.nombre, request.body.apellidoP, request.body.apellidoM, request.body.fechaNac, request.body.telefono.toString());
                                    nuevoEmpleado.save_empleado()
                                    .then(() => {
                                    const flag = 'success';
                                    response.render('signup_login/signIn', {
                                        flag: flag
                                    });
                                    })
                                    .catch((err) => {
                                        console.log(err);
                                    });
                                } else {
                                    const flag = 'ExisteEmailAux';
                                    response.render('signup_login/signIn', {
                                        flag: flag,
                                        nombre: request.body.nombre,
                                        apellidoPat: request.body.apellidoP,
                                        apellidoMat: request.body.apellidoM,
                                        nomina: request.body.nomina,
                                        fechaNac: request.body.fechaNac,
                                        tel: request.body.telefono,
                                        email: request.body.email
                                    });
                                }
                            })
                            .catch((error) => {
                                console.log(error);
                            })
                        } else {
                            const flag = 'ExisteNominaAux';
                            response.render('signup_login/signIn', {
                                flag: flag,
                                nombre: request.body.nombre,
                                apellidoPat: request.body.apellidoP,
                                apellidoMat: request.body.apellidoM,
                                nomina: request.body.nomina,
                                fechaNac: request.body.fechaNac,
                                tel: request.body.telefono,
                                email: request.body.email
                            });
                        }
                    })
                    .catch((error) => {
                        console.log(error);
                    })
                } else {
                    const flag = 'EmailExiste';
                    response.render('signup_login/signIn', {
                        flag: flag,
                        nombre: request.body.nombre,
                        apellidoPat: request.body.apellidoP,
                        apellidoMat: request.body.apellidoM,
                        nomina: request.body.nomina,
                        fechaNac: request.body.fechaNac,
                        tel: request.body.telefono,
                        email: request.body.email
                    });
                }
            })
            .catch((error) => {
                console.log(error);
            })
        } else {
            const flag = 'NominaExiste';
            response.render('signup_login/signIn', {
                flag: flag,
                nombre: request.body.nombre,
                apellidoPat: request.body.apellidoP,
                apellidoMat: request.body.apellidoM,
                nomina: request.body.nomina,
                fechaNac: request.body.fechaNac,
                tel: request.body.telefono,
                email: request.body.email
            });
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
        if (empleado.estatusEmpleado == 0){
            const flag = 'invalidCredentials';
            response.render('signup_login/signIn.ejs', {
                flag: flag
            });
        } else if (empleado.estatusEmpleado == 1){
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
                                for (let privilegio of rows[0]) {
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
            });
        }   
    })
    .catch((error) => {
        console.log(error);
    })
}

exports.logout = (request, response, next) => {
    request.session.destroy(() => {
        response.redirect('/');
    })
}

exports.formEmpleados = (request, response, next) => {
    if (request.session.privilegios.includes('registrarEmpleados')) {
    empleados.fetchEmpleadosSinRegistrar()
    .then(([empleado, fieldData]) => {
        empleados.fetchAreas()
        .then(([areas, fieldData]) => {
            empleados.fetchLideres()
            .then(([lideres, fieldData]) => {
                empleados.fetchRoles()
                .then(([roles, fieldData]) => {
                    empleados.fetchPlazas()
                    .then(([plazas, fieldData]) => {
                        const flag = '';
                        response.render('empleados/aceptarEmpleados', {
                            sesion: request.session.empleado,
                            rol: request.session.rol,
                            privilegios: request.session.privilegios,
                            solicitudes: empleado,
                            areas: areas,
                            lideres: lideres,
                            roles: roles,
                            flag: flag,
                            plazas: plazas
                        })
                    })
                    .catch((error) => {
                        console.log(error);
                    })
                })
                .catch((error) => {
                    console.log(error);
                })
            })
            .catch((error) => {
                console.log(error)
            })
        })
        .catch((error) => {
            console.log(error);
        });
    })
    .catch((error) => {
        console.log(error);
    });
    } else {
        response.redirect('/Unauthorized');
    }
};

exports.registrarEmpleado = (request, response, next) => {

    empleados.findRegistroEmpleado(request.body.idEmpleado)
    .then(([empleado, fieldData]) => {
        const infoEmpleado = empleado[0];
        const fechaIngreso = new Date(request.body.fechaIng);
        const currentDate = new Date();
        const auxAntiguedad = currentDate.getTime() - fechaIngreso.getTime();
        const antiguedad = Math.floor((auxAntiguedad / (1000 * 3600 * 24))/365);
        const ngb = parseInt(request.body.ngb);
        const vacPremio = parseInt(request.body.vacPremio);
        const vacLey = parseInt(request.body.vacLey);
        const vacTot = vacLey + vacPremio;
        const plaza = request.body.plaza.toString();
        const lider = parseInt(request.body.lider);
        const area = parseInt(request.body.area);
        const rol = parseInt(request.body.rol);

        empleados.registrarEmpleado(infoEmpleado.idEmpleado, infoEmpleado.email, infoEmpleado.token, infoEmpleado.nombre, infoEmpleado.apellidoPaterno, infoEmpleado.apellidoMaterno, infoEmpleado.fechaNac, request.body.fechaIng, infoEmpleado.numTelefonico, ngb, antiguedad, vacTot, vacLey, vacPremio, plaza)
        .then(() => {
            const flag = 'success';
            empleados.fetchEmpleadosSinRegistrar()
                .then(([empleado, fieldData]) => {
                    empleados.fetchAreas()
                    .then(([areas, fieldData]) => {
                        empleados.fetchLideres()
                        .then(([lideres, fieldData]) => {
                            empleados.fetchRoles()
                            .then(([roles, fieldData]) => {
                                empleados.fetchPlazas()
                                .then(([plazas, fieldData]) => {
                                    empleados.registrarInfoEmpleado(infoEmpleado.idEmpleado, lider, area, rol)
                                    .then(() => {
                                        let respuestaHTML ='<h1>Estatus de Solicitud de ingreso a la plataforma</h1>';
                                        respuestaHTML += 'Estimado ' + infoEmpleado.nombre + ' ' + infoEmpleado.apellidoPaterno + ' ' + infoEmpleado.apellidoMaterno + ',<br><br>';
                                        respuestaHTML += 'Le envíamos este correo para informarle que su solicitud de registro a la Intranet NATGAS ha sido <span style="font-weight: 600;">ACEPTADA</span>.'; 
                                        const options = {
                                            from: "no-reply-NATGAS@hotmail.com",
                                            to: infoEmpleado.email,
                                            subject: "Estatus de Solicitud en Intranet NATGAS",
                                            html: respuestaHTML
                                        }
                                        transporter.sendMail(options)
                                        .then((info) => {
                                            console.log(info);
                                            response.render('empleados/aceptarEmpleados', {
                                                sesion: request.session.empleado,
                                                rol: request.session.rol,
                                                privilegios: request.session.privilegios,
                                                solicitudes: empleado,
                                                areas: areas,
                                                lideres: lideres,
                                                roles: roles,
                                                flag: flag,
                                                infoEmpleado: infoEmpleado,
                                                plazas: plazas
                                            })  
                                        })
                                        .catch((error) => {
                                            console.log(error);
                                        });
                                    })
                                    .catch((error) => {
                                        console.log(error);
                                    });
                                })
                                .catch((error) => {
                                    console.log(error);
                                })        
                            })
                            .catch((error) => {
                            console.log(error);
                            })
                        })
                        .catch((error) => {
                            console.log(error)
                        })
                    })
                    .catch((error) => {
                        console.log(error);
                    });
                })
                .catch((error) => {
                    console.log(error);
                });
        })
        .catch((error) => {
        console.log(error);
        });
    })
    .catch((error) => {
        console.log(error);
    });
};

exports.rechazarRegistroEmpleado = (request, response, next) => {
    const flag = 'denySuccess';
    empleados.findRegistroEmpleado(request.body.idEmpleado)
    .then(([rows, fieldData]) => {
        const infoEmpleado = rows[0];
        empleados.cancelarRegistro(request.body.idEmpleado)
        .then(() => {
            empleados.fetchEmpleadosSinRegistrar()
            .then(([empleado, fieldData]) => {
                empleados.fetchAreas()
                .then(([areas, fieldData]) => {
                    empleados.fetchLideres()
                    .then(([lideres, fieldData]) => {
                        empleados.fetchRoles()
                        .then(([roles, fieldData]) => {
                            empleados.fetchPlazas()
                            .then(([plazas, fieldData]) => {
                                let respuestaHTML ='<h1>Estatus de Solicitud de ingreso a la plataforma</h1>';
                                respuestaHTML += 'Estimado ' + infoEmpleado.nombre + ' ' + infoEmpleado.apellidoPaterno + ' ' + infoEmpleado.apellidoMaterno + ',<br><br>';
                                respuestaHTML += 'Le envíamos este correo para informarle que su solicitud de registro a la Intranet NATGAS ha sido <span style="font-weight: 600;">RECHAZADA</span>.'; 
                                const options = {
                                    from: "no-reply-NATGAS@hotmail.com",
                                    to: infoEmpleado.email,
                                    subject: "Estatus de Solicitud en Intranet NATGAS",
                                    html: respuestaHTML
                                }
                                transporter.sendMail(options)
                                .then((info) => {
                                    console.log(info);
                                    response.render('empleados/aceptarEmpleados', {
                                        sesion: request.session.empleado,
                                        rol: request.session.rol,
                                        privilegios: request.session.privilegios,
                                        solicitudes: empleado,
                                        areas: areas,
                                        lideres: lideres,
                                        roles: roles,
                                        flag: flag,
                                        infoEmpleado: infoEmpleado,
                                        plazas: plazas
                                    })
                                })
                                .catch((error) => {
                                    console.log(error);
                                });
                            }).catch((error) => {
                                console.log(error);
                            })
                        }).catch((error) =>{
                            console.log(error);
                        })
                    }).catch((error) => {
                        console.log(error);
                        });
                }).catch((error) => {
                    console.log(error)
                });
            }).catch((error) => {
                console.log(error);
            });
        }).catch((error) => {
            console.log(error);
        });
    }).catch((error) => {
        console.log(error);
    })
};

exports.usuarios = (request,response,next) =>{
    if (request.session.privilegios.includes('consultarEmpleado')) {
    if(request.session.rol == "admin"){
        empleados.fetchEmpleadoYRolADMIN(request.session.empleado.idEmpleado)
    .then(([rows,fieldData]) =>{
        const flag = '';
        response.render('empleados/empleadosExistentes', {
            sesion: request.session.empleado,
            rol: request.session.rol,
            privilegios: request.session.privilegios,
            empleados: rows,
            flag: flag
        });
    }).catch((error) => {
        console.log(error);
    });
    } else {

    empleados.fetchEmpleadoYRol()
    .then(([rows,fieldData]) =>{
        const flag = '';
        response.render('empleados/empleadosExistentes', {
            sesion: request.session.empleado,
            rol: request.session.rol,
            privilegios: request.session.privilegios,
            empleados: rows,
            flag: flag
        });
    }).catch((error) => {
        console.log(error);
    });
    }
    } else {
        response.redirect('/Unauthorized');
    }
};

exports.buscarUsuario = (request, response, next) => {
    if (request.session.privilegios.includes('consultarEmpleado')) {
    if(request.session.rol == "admin"){
        empleados.fetchEmpleadoADMIN(request.session.empleado.idEmpleado, request.params.criterio)
    .then(([rows,FieldData]) => {
        response.status(200).json(rows);
    }).catch(error =>{console.log(error);})
    }else{
    empleados.fetchEmpleado(request.params.criterio)
    .then(([rows,FieldData]) => {
        response.status(200).json(rows);
    }).catch(error =>{console.log(error);})
    }
    } else {
        response.redirect('/Unauthorized');
    }
}

exports.borrarUsuario = (request, response, next) => {
    const id = request.body.delete;
    const nombre = request.body.nombre + ' ' + request.body.apPat + ' ' + request.body.apMat;
    console.log(id);
    const flag = 'eliminarExitoso';

    

    empleados.borrarEmpleado(id)
    .then(() => {
        empleados.fetchEmpleadoYRol()
        .then(([rows,fieldData]) => {
            response.render('empleados/empleadosExistentes', {
                sesion: request.session.empleado,
                rol: request.session.rol,
                privilegios: request.session.privilegios,
                empleados: rows,
                nombre: nombre,
                flag: flag
            });
        }).catch((error) => {
            console.log(error);
        });
    })
    .catch((err) => {
        console.log(err);
    });
};
