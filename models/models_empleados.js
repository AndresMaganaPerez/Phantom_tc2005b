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

    static verificarNomina(nomina){
        return db.execute('SELECT * FROM empleado WHERE idEmpleado = ?', [nomina]);
    }

    static verificarEmail(email){
        return db.execute('SELECT * FROM empleado WHERE email = ?', [email]);
    }

    static verificarNominaAux(nomina){
        return db.execute('SELECT * FROM solicitudesregistroempleados WHERE idEmpleado = ?', [nomina]);
    }

    static verificarEmailAux(email){
        return db.execute('SELECT * FROM solicitudesregistroempleados WHERE email = ?', [email]);
    }

    save_empleado() {
        return bcrypt.hash(this.token, 12)
        .then((token_cifrado) => {
            return db.execute('INSERT INTO solicitudesregistroempleados (idEmpleado, email, token, nombre, apellidoPaterno, apellidoMaterno, fechaNac, numTelefonico) VALUES (?, ?, ?, ?, ?, ?, ?, ?)' , [this.nomina, this.email, token_cifrado, this.nombre, this.apellidoPaterno, this.apellidoMaterno, this.fechaNac, this.numTel]);
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

    static fetchEmpleadoYRol() {
        return db.execute('SELECT empleado.idEmpleado, email, empleado.nombre, apellidoPaterno, apellidoMaterno, fechaNac, fechaIngr, numTelefonico, cantidadNatgasBlocks, antiguedad, vacacionesTotales, numVacacionesLey, numVacacionesPremio, plaza, roles.idRol, descripcionRol, area.idArea, area.nombre AS "nombreArea" FROM empleado, empleado_rol, roles, area_empleado, area WHERE empleado.idEmpleado = empleado_rol.idEmpleado AND empleado_rol.idRol = roles.idRol AND empleado.idEmpleado = area_empleado.idEmpleado AND area_empleado.idArea = area.idArea;')
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
            'SELECT empleado.idEmpleado, email, empleado.nombre, apellidoPaterno, apellidoMaterno, fechaNac, fechaIngr, numTelefonico, cantidadNatgasBlocks, antiguedad, vacacionesTotales, numVacacionesLey, numVacacionesPremio, plaza, roles.idRol, descripcionRol, area.idArea, area.nombre AS "nombreArea" FROM empleado, empleado_rol, roles, area_empleado, area WHERE empleado.idEmpleado = empleado_rol.idEmpleado AND empleado_rol.idRol = roles.idRol AND empleado.idEmpleado = area_empleado.idEmpleado AND area_empleado.idArea = area.idArea AND (empleado.nombre LIKE ? OR empleado.apellidoPaterno LIKE ? OR empleado.apellidoMaterno LIKE ? OR area.nombre LIKE ? OR plaza LIKE ? OR descripcionRol LIKE ? OR empleado.idEmpleado LIKE ?);',
            ['%'+ criterio +'%', '%'+ criterio +'%', '%'+ criterio +'%', '%'+ criterio +'%', '%'+ criterio +'%', '%'+ criterio +'%', '%'+ criterio +'%']);
    }

    static saveTel(nomina, telefono) {
        return db.execute('UPDATE empleado SET numTelefonico = ? WHERE idEmpleado = ?', [telefono, nomina]);
    }

    static fetchTel(nomina) {
        return db.execute('SELECT numTelefonico FROM empleado WHERE idEmpleado = ?', [nomina]);
    }

    static fetchEmpleadosSinRegistrar() {
        return db.execute('SELECT idEmpleado, nombre, apellidoPaterno, apellidoMaterno, fechaNac, numTelefonico, email, fechaSolicitud FROM solicitudesregistroempleados');
    }

    static fetchAreas() {
        return db.execute('SELECT * FROM area');
    }

    static fetchRoles() {
        return db.execute('SELECT * FROM roles');
    }

    static fetchLideres() {
        return db.execute('SELECT d.idLider, nombre, apellidoPaterno, apellidoMaterno FROM dirige d, empleado e WHERE d.idLider = e.idEmpleado GROUP BY d.idLider');
    }

    static findRegistroEmpleado(nomina){
        return db.execute('SELECT * FROM solicitudesregistroempleados WHERE idEmpleado = ?', [nomina]);
    }

    static registrarEmpleado(nomina, email, token, nombre, apellidoPat, apellidoMat, fechaNac, fechaIng, tel, cantidadNGB, antiguedad, vacTot, vacLey, vacPrem, plaza) {
        return db.execute('CALL aceptarRegistroEmpleado(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)', [nomina, email, token, nombre, apellidoPat, apellidoMat, fechaNac, fechaIng, tel, cantidadNGB, antiguedad, vacTot, vacTot, vacLey, vacPrem, plaza]);
    }

    static registrarInfoEmpleado(nomina, lider, area, rol){
        return db.execute('CALL registrarInfoEmpleado(?,?,?,?)', [nomina, lider, area, rol]);
    }

    static cancelarRegistro(nomina) {
        return db.execute('DELETE FROM solicitudesregistroempleados WHERE idEmpleado = ?', [nomina]);
    }
}