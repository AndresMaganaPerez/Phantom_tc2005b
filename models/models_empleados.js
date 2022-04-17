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
        return db.execute('SELECT e.idEmpleado, email, e.nombre, apellidoPaterno, apellidoMaterno, fechaNac, fechaIngr, numTelefonico, cantidadNatgasBlocks, antiguedad, vacacionesTotales, numVacacionesLey, numVacacionesPremio, plaza, a.nombre AS "area" FROM empleado e, area a, area_empleado ae WHERE e.idEmpleado = ae.idEmpleado AND a.idArea = ae.idArea AND email=?', [usuario]);
    }

    static getPassword(nomina) {
        return db.execute('SELECT token from empleado WHERE email=?', [nomina]);
    }

    static findRol(nomina) {
       return db.execute('SELECT descripcionRol FROM empleado e, roles r, empleado_rol eR WHERE e.idEmpleado=eR.idEmpleado AND r.idRol=eR.idRol AND eR.idEmpleado=?', [nomina]);
    }

    static findPrivilegio(rol) {
        return db.execute('SELECT accion FROM roles_privilegios rp, privilegios p, roles r WHERE p.idPrivilegio = rp.idPrivilegio AND r.idRol = rp.idRol AND descripcionRol=?', [rol]);
    }
}