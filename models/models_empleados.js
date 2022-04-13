const db = require('../util/database');
const bcrypt = require('bcryptjs');

module.exports = class Empleados{
    constructor(_nomina, _email, _token, _nombre, _apellidoPaterno, _apellidoMaterno, _fechaNac, _numTel){
        this.nomina = _nomina;
        this.email = _email;
        this.token = _token;
        this.nombre = _nombre;
        this.apellidoPaterno = _apellidoPaterno;
        this.apellidoMaterno = _apellidoMaterno;
        this.fechaNac = _fechaNac;
        this.numTel = _numTel;
    }

    save_empleado() {
        return bcrypt.hash(this.token, 12)
        .then((token_cifrado) => {
            return db.execute('INSERT INTO empleado (idEmpleado, email, token, nombre, apellidoPaterno, apellidoMaterno, fechaNac, numTelefonico) VALUES (?, ?, ?, ?, ?, ?, ?, ?)' , [this.nomina, this.email, token_cifrado, this.nombre, this.apellidoPaterno, this.apellidoMaterno, this.fechaNac, this.numTel]);
        })
        .catch((error) => {
            console.log(error);
        });
        
    }

    static findEmpleado(usuario) {
        return db.execute('SELECT * FROM empleado WHERE email=?', [usuario]);
    }

    static findRol(nomina) {
       return db.execute('SELECT descripcionRol FROM empleado e, roles r, empleado_rol eR WHERE e.idEmpleado=eR.idEmpleado AND r.idRol=eR.idRol AND eR.idEmpleado=?', [nomina]);
    }

    static findPrivilegio(rol) {
        return db.execute('SELECT accion FROM roles_privilegios rp, privilegios p, roles r WHERE p.idPrivilegio = rp.idPrivilegio AND r.idRol = rp.idRol AND descripcionRol=?', [rol]);
    }

    // Funcion Filtrar solicitudes de vacaciones por Mes
    static filtraSolVacacionesMes(mes) {
        if (mes == 'Enero') {
            return db.execute('SELECT * FROM solicitudvacaciones WHERE fechaInicio BETWEEN "2022-01-01" AND "2022-01-31"');
        } else if (mes == 'Febrero') {
            return db.execute('SELECT * FROM solicitudvacaciones WHERE fechaInicio BETWEEN "2022-02-01" AND "2022-02-31"');
        } else if (mes == 'Marzo') {
            return db.execute('SELECT * FROM solicitudvacaciones WHERE fechaInicio BETWEEN "2022-03-01" AND "2022-03-31"');
        } else if (mes == 'Abril') {
            return db.execute('SELECT * FROM solicitudvacaciones WHERE fechaInicio BETWEEN "2022-04-01" AND "2022-04-31"');
        } else if (mes == 'Mayo') {
            return db.execute('SELECT * FROM solicitudvacaciones WHERE fechaInicio BETWEEN "2022-05-01" AND "2022-05-31"');
        } else if (mes == 'Junio') {
            return db.execute('SELECT * FROM solicitudvacaciones WHERE fechaInicio BETWEEN "2022-06-01" AND "2022-06-31"');
        } else if (mes == 'Julio') {
            return db.execute('SELECT * FROM solicitudvacaciones WHERE fechaInicio BETWEEN "2022-07-01" AND "2022-07-31"');
        } else if (mes == 'Agosto') {
            return db.execute('SELECT * FROM solicitudvacaciones WHERE fechaInicio BETWEEN "2022-08-01" AND "2022-08-31"');
        } else if (mes == 'Septiembre') {
            return db.execute('SELECT * FROM solicitudvacaciones WHERE fechaInicio BETWEEN "2022-09-01" AND "2022-09-31"');
        } else if (mes == 'Octubre') {
            return db.execute('SELECT * FROM solicitudvacaciones WHERE fechaInicio BETWEEN "2022-10-01" AND "2022-10-31"');
        } else if (mes == 'Noviembre') {
            return db.execute('SELECT * FROM solicitudvacaciones WHERE fechaInicio BETWEEN "2022-11-01" AND "2022-11-31"');
        } else if (mes == 'Diciembre') {
            return db.execute('SELECT * FROM solicitudvacaciones WHERE fechaInicio BETWEEN "2022-12-01" AND "2022-12-31"');
        }
    }

    // Funcion Filtrar solicitudes de Natgas Block por Mes
    static filtraSolNGBMes(mes) {
        if (mes == 'Enero') {
            return db.execute('SELECT * FROM solicitudvacaciones WHERE fechaInicio BETWEEN "2022-01-01" AND "2022-01-31"');
        } else if (mes == 'Febrero') {
            return db.execute('SELECT * FROM solicitudvacaciones WHERE fechaInicio BETWEEN "2022-02-01" AND "2022-02-31"');
        } else if (mes == 'Marzo') {
            return db.execute('SELECT * FROM solicitudvacaciones WHERE fechaInicio BETWEEN "2022-03-01" AND "2022-03-31"');
        } else if (mes == 'Abril') {
            return db.execute('SELECT * FROM solicitudvacaciones WHERE fechaInicio BETWEEN "2022-04-01" AND "2022-04-31"');
        } else if (mes == 'Mayo') {
            return db.execute('SELECT * FROM solicitudvacaciones WHERE fechaInicio BETWEEN "2022-05-01" AND "2022-05-31"');
        } else if (mes == 'Junio') {
            return db.execute('SELECT * FROM solicitudvacaciones WHERE fechaInicio BETWEEN "2022-06-01" AND "2022-06-31"');
        } else if (mes == 'Julio') {
            return db.execute('SELECT * FROM solicitudvacaciones WHERE fechaInicio BETWEEN "2022-07-01" AND "2022-07-31"');
        } else if (mes == 'Agosto') {
            return db.execute('SELECT * FROM solicitudvacaciones WHERE fechaInicio BETWEEN "2022-08-01" AND "2022-08-31"');
        } else if (mes == 'Septiembre') {
            return db.execute('SELECT * FROM solicitudvacaciones WHERE fechaInicio BETWEEN "2022-09-01" AND "2022-09-31"');
        } else if (mes == 'Octubre') {
            return db.execute('SELECT * FROM solicitudvacaciones WHERE fechaInicio BETWEEN "2022-10-01" AND "2022-10-31"');
        } else if (mes == 'Noviembre') {
            return db.execute('SELECT * FROM solicitudvacaciones WHERE fechaInicio BETWEEN "2022-11-01" AND "2022-11-31"');
        } else if (mes == 'Diciembre') {
            return db.execute('SELECT * FROM solicitudvacaciones WHERE fechaInicio BETWEEN "2022-12-01" AND "2022-12-31"');
        }
    }
} 