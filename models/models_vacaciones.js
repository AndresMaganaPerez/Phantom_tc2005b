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

    static fetchAll(nomina) {
        return db.execute ('SELECT * FROM solicitudvacaciones WHERE idEmpleado=? ORDER BY idSolicitud DESC', [nomina]);
    }

    static fetchOpVac(nomina) {
        return db.execute ('SELECT * FROM solicitudvacaciones WHERE idLider=? ORDER BY fechaSolicitud DESC', [nomina]);
    }

    static fetchMisVacaciones(nomina) {
        return db.execute ('SELECT * FROM solicitudvacaciones WHERE idEmpleado=? ORDER BY fechaInicio DESC', [nomina]);
    }

    static fetchSolicitud(solicitudId) {
        return db.execute('SELECT * FROM solicitudvacaciones WHERE idSolicitud = ?', [solicitudId]);
    }

    static updateSolicitud(solicitudId, status) {
        return db.execute('UPDATE solicitudes SET status = ? WHERE idSolicitud = ?', [status, solicitudId]);
    }
}