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

    static borrarSolicitud(idEmpleado, idSolicitud) {
        return db.execute('DELETE FROM solicitudvacaciones WHERE idEmpleado=? AND idSolicitud=?', [idEmpleado, idSolicitud])
    }

    static fetchAll(nomina) {
        return db.execute ('SELECT * FROM solicitudvacaciones WHERE idEmpleado=? ORDER BY idSolicitud DESC', [nomina]);
    }

    static fetchMisVacaciones(nomina) {
        return db.execute ('SELECT * FROM solicitudvacaciones WHERE idEmpleado=? ORDER BY fechaInicio ASC', [nomina]);
    }
}