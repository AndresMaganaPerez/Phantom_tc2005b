const db = require('../util/database');

module.exports = class solicitudVacaciones {

    constructor(_nomina, _fechaInicio, _fechaFin, _fechaReanudacion, _suplente) {
        this.nomina = _nomina;
        this.fechaInicio = _fechaInicio;
        this.fechaFin = _fechaFin;
        this.fechaReanudacion = _fechaReanudacion;
        this.suplente = _suplente;
    }

    saveSolicitud() {
        return db.execute('INSERT INTO solicitudvacaciones (idEmpleado, fechaInicio, fechaFin, fechaReanudacion, suplente) VALUES (?, ?, ?, ?, ?)', [this.nomina, this.fechaInicio, this.fechaFin, this.fechaReanudacion, this.suplente]);
    }

    static fetchAllVacaciones() {
        return db.execute ("SELECT idSolicitud, e.idEmpleado AS 'solicita', e.nombre AS 'nomSolicita', e.apellidoPaterno AS 'apellidoPatSolicita', e.apellidoMaterno AS 'apellidoMatSolicita', sv.fechaInicio, sv.fechaFin, sv.fechaReanudacion, sv.fechaSolicitud, sv.suplente, sv.solicitudAceptadaEstatus, d.idLider, f.nombre AS 'nomLider', f.apellidoPaterno AS 'apellidoPatLider', f.apellidoMaterno AS 'apellidoMatLider' FROM solicitudvacaciones sv, empleado e, empleado f, dirige d WHERE sv.idEmpleado = e.idEmpleado AND d.idOperador = e.idEmpleado AND d.idLider = f.idEmpleado AND solicitudAceptadaEstatus IS NOT NULL;");
    }

    static fetchLider(nomina) {
        return db.execute('SELECT d.idLider, nombre, apellidoPaterno, apellidoMaterno FROM empleado e, dirige d WHERE e.idEmpleado=d.idLider AND idOperador=?', [nomina]);
    }

    static fetchMisVacaciones(nomina) {
        return db.execute ('SELECT * FROM solicitudvacaciones WHERE idEmpleado=? ORDER BY fechaInicio ASC', [nomina]);
    }
}