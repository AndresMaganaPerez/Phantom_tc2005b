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
        return db.execute('SELECT idEmpleado, email, nombre, apellidoPaterno, apellidoMaterno, fechaNac, fechaIngr, numTelefonico, cantidadNatgasBlocks, antiguedad, vacacionesTotales, numVacacionesLey, numVacacionesPremio, plaza FROM empleado WHERE email=?', [usuario]);
    }

    static getPassword(nomina) {
        return db.execute('SELECT token from empleado WHERE email=?', [nomina]);
    }

    static fetchEmpleadoYRol() {
        return db.execute('SELECT * FROM empleado,empleado_rol,roles, area_empleado, area WHERE empleado.idEmpleado = empleado_rol.idEmpleado AND empleado_rol.idRol = roles.idRol AND empleado.idEmpleado = area_empleado.idEmpleado AND area_empleado.idArea = area.idArea;')
    }

    static findRol(nomina) {
       return db.execute('SELECT descripcionRol FROM empleado e, roles r, empleado_rol eR WHERE e.idEmpleado=eR.idEmpleado AND r.idRol=eR.idRol AND eR.idEmpleado=?', [nomina]);
    }

    static findPrivilegio(rol) {
        return db.execute('SELECT accion FROM roles_privilegios rp, privilegios p, roles r WHERE p.idPrivilegio = rp.idPrivilegio AND r.idRol = rp.idRol AND descripcionRol=?', [rol]);
    }

    static borrarEmpleado(_nomina){
        return db.execute('DELETE FROM empleado WHERE idEmpleado=?',[_nomina]);
    }

    static fetchEmpleado(criterio) {
        return db.execute(
            'SELECT * FROM empleado WHERE nombre LIKE ? OR idEmpleado LIKE ?',
            ['%'+ criterio +'%','%'+ criterio +'%'])
    }
}