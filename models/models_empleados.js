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
        return db.execute('SELECT e.idEmpleado, email, e.nombre, apellidoPaterno, apellidoMaterno, fechaNac, fechaIngr, numTelefonico, cantidadNatgasBlocks, antiguedad, vacacionesTotales, numVacacionesLey, numVacacionesPremio, a.nombre AS "area", estatusEmpleado FROM empleado e, area a, area_empleado ae WHERE e.idEmpleado = ae.idEmpleado AND a.idArea = ae.idArea AND email=?', [usuario]);
    }

    static getPassword(nomina) {
        return db.execute('SELECT token from empleado WHERE email=?', [nomina]);
    }

    static fetchEmpleadoYRol() {
        return db.execute('SELECT empleado.idEmpleado, email, empleado.nombre, apellidoPaterno, apellidoMaterno, fechaNac, fechaIngr, numTelefonico, cantidadNatgasBlocks, antiguedad, vacacionesTotales, numVacacionesLey, numVacacionesPremio, roles.idRol, nombreRolEmpresa, area.idArea, area.nombre AS "nombreArea", plaza.idPlaza, nombrePlaza FROM empleado, empleado_rol, roles, area_empleado, area, plaza, plaza_empleado WHERE empleado.idEmpleado = empleado_rol.idEmpleado AND empleado_rol.idRol = roles.idRol AND empleado.idEmpleado = area_empleado.idEmpleado AND area_empleado.idArea = area.idArea AND empleado.idEmpleado = plaza_empleado.idEmpleado AND plaza.idPlaza = plaza_empleado.idPlaza AND estatusEmpleado = 1 AND empleado_rol.fechaFin IS NULL AND plaza_empleado.fechaFin IS NULL AND area_empleado.fechaFin IS NULL AND NOT area.nombre = "Recursos Humanos";')
    }
    
    static fetchEmpleadoYRolADMIN(idAdmin){
        return db.execute('SELECT empleado.idEmpleado, email, empleado.nombre, apellidoPaterno, apellidoMaterno, fechaNac, fechaIngr, numTelefonico, cantidadNatgasBlocks, antiguedad, vacacionesTotales, numVacacionesLey, numVacacionesPremio, roles.idRol, nombreRolEmpresa, area.idArea, area.nombre AS "nombreArea", plaza.idPlaza, nombrePlaza FROM empleado, empleado_rol, roles, area_empleado, area, plaza, plaza_empleado WHERE empleado.idEmpleado = empleado_rol.idEmpleado AND empleado_rol.idRol = roles.idRol AND empleado.idEmpleado = area_empleado.idEmpleado AND area_empleado.idArea = area.idArea AND empleado.idEmpleado = plaza_empleado.idEmpleado AND plaza.idPlaza = plaza_empleado.idPlaza AND estatusEmpleado = 1 AND empleado_rol.fechaFin IS NULL AND plaza_empleado.fechaFin IS NULL AND area_empleado.fechaFin IS NULL AND NOT empleado.idEmpleado=?;',[idAdmin])
    }

    static findRol(nomina) {
        return db.execute('SELECT descripcionRol FROM empleado e, roles r, empleado_rol eR WHERE e.idEmpleado=eR.idEmpleado AND r.idRol=eR.idRol AND eR.idEmpleado=?', [nomina]);
     }

    static findPrivilegio(rol) {
        return db.execute('SELECT accion FROM roles_privilegios rp, privilegios p, roles r WHERE p.idPrivilegio = rp.idPrivilegio AND r.idRol = rp.idRol AND descripcionRol=?', [rol]);
    }

    static borrarEmpleado(_nomina){
        return db.execute('UPDATE empleado SET estatusEmpleado = 0 WHERE idEmpleado = ?',[_nomina]);
    }

    static fetchEmpleado(criterio) {
        return db.execute(
            'SELECT empleado.idEmpleado, email, empleado.nombre, apellidoPaterno, apellidoMaterno, fechaNac, fechaIngr, numTelefonico, cantidadNatgasBlocks, antiguedad, vacacionesTotales, numVacacionesLey, numVacacionesPremio, roles.idRol, nombreRolEmpresa, area.idArea, area.nombre AS "nombreArea", plaza.idPlaza, nombrePlaza FROM empleado, empleado_rol, roles, area_empleado, area, plaza, plaza_empleado WHERE empleado.idEmpleado = empleado_rol.idEmpleado AND empleado_rol.idRol = roles.idRol AND empleado.idEmpleado = area_empleado.idEmpleado AND area_empleado.idArea = area.idArea AND empleado.idEmpleado = plaza_empleado.idEmpleado AND plaza.idPlaza = plaza_empleado.idPlaza AND estatusEmpleado = 1 AND NOT area.nombre = "Recursos Humanos" AND (empleado.nombre LIKE ? OR empleado.apellidoPaterno LIKE ? OR empleado.apellidoMaterno LIKE ? OR area.nombre LIKE ? OR nombrePlaza LIKE ? OR nombreRolEmpresa LIKE ? OR empleado.idEmpleado LIKE ?);',
            ['%'+ criterio +'%', '%'+ criterio +'%', '%'+ criterio +'%', '%'+ criterio +'%', '%'+ criterio +'%', '%'+ criterio +'%', '%'+ criterio +'%']);
    }

    static fetchEmpleadoADMIN(admin,criterio) {
        return db.execute(
            'SELECT empleado.idEmpleado, email, empleado.nombre, apellidoPaterno, apellidoMaterno, fechaNac, fechaIngr, numTelefonico, cantidadNatgasBlocks, antiguedad, vacacionesTotales, numVacacionesLey, numVacacionesPremio, roles.idRol, nombreRolEmpresa, area.idArea, area.nombre AS "nombreArea", plaza.idPlaza, nombrePlaza FROM empleado, empleado_rol, roles, area_empleado, area, plaza, plaza_empleado WHERE empleado.idEmpleado = empleado_rol.idEmpleado AND empleado_rol.idRol = roles.idRol AND empleado.idEmpleado = area_empleado.idEmpleado AND area_empleado.idArea = area.idArea AND empleado.idEmpleado = plaza_empleado.idEmpleado AND plaza.idPlaza = plaza_empleado.idPlaza AND estatusEmpleado = 1 AND NOT empleado.idEmpleado = ? AND (empleado.nombre LIKE ? OR empleado.apellidoPaterno LIKE ? OR empleado.apellidoMaterno LIKE ? OR area.nombre LIKE ? OR nombrePlaza LIKE ? OR nombreRolEmpresa LIKE ? OR empleado.idEmpleado LIKE ?);',
            [admin ,'%'+ criterio +'%', '%'+ criterio +'%', '%'+ criterio +'%', '%'+ criterio +'%', '%'+ criterio +'%', '%'+ criterio +'%', '%'+ criterio +'%']);
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
        return db.execute('SELECT * FROM area ORDER BY nombre DESC');
    }

    static fetchRoles() {
        return db.execute('SELECT * FROM roles ORDER BY nombreRolEmpresa DESC');
    }

    static fetchPlazas() {
        return db.execute('SELECT * FROM plaza ORDER BY nombrePlaza DESC');
    }

    static fetchLideres() {
        return db.execute('SELECT d.idLider, e.nombre, apellidoPaterno, apellidoMaterno, a.idArea, a.nombre AS nombreArea FROM dirige d, empleado e, area a, area_empleado ae WHERE d.idLider = e.idEmpleado AND d.idLider = ae.idEmpleado AND a.idArea = ae.idArea GROUP BY d.idLider;');
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

    static fetchLiderDeEmeplado(nomina){
        return db.execute('SELECT l.idEmpleado, l.nombre,l.apellidoPaterno,l.apellidoMaterno FROM empleado e, empleado l, dirige WHERE dirige.idOperador = e.idEmpleado AND l.idEmpleado = dirige.idLider AND e.idEmpleado =?;',[nomina])
    }

    static modificarEmpleado(idEmpleado,idArea,idLider,idPlaza,idRol,fechaIngr,NGB,VacL,VacP){
        return db.execute('CALL modificarEmpleado(?,?,?,?,?,?,?,?,?)', [idEmpleado,idArea,idLider,idPlaza,idRol,fechaIngr,NGB,VacL,VacP]);
    }
}