const db = require('../util/database');

module.exports = class solicitudVacaciones {

    constructor(nomina, fechaInicio, fechaFin, suplente) {
        this.noNomina = nomina;
        this.fechaInicio = fechaInicio;
        this.fechaFin = fechaFin;
        this.suplente = suplente;
    }

    saveSolicitud() {
        return db.execute('INSERT INTO solicitudvacaciones (idEmpleado, fechaInicio, fechaFin, suplente) VALUES (?, ?, ?, ?)', [this.noNomina, this.fechaInicio, this.fechaFin, this.suplente]);
    }

    static fetchAll(nomina) {
        return db.execute ('SELECT * FROM solicitudvacaciones WHERE idEmpleado=? ORDER BY idSolicitud DESC', [nomina]);
    }
}