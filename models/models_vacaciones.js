const db = require('../util/database');

module.exports = class solicitudVacaciones {

    constructor(_nomina, _fechaInicio, _fechaFin, _fechaReanudacion, _suplente) {
        this.nomina = _nomina;
        this.fechaInicio = _fechaInicio;
        this.fechaFin = _fechaFin;
        this.fechaReanudacion = _fechaReanudacion;
        this.suplente = _suplente;
    }

    saveSolicitud(vacacionesUsadas) {
        return db.execute('call enviarSolicitudVac(?, ?, ?, ?, ?, ?)', [this.nomina, this.fechaInicio, this.fechaFin, this.fechaReanudacion, this.suplente, vacacionesUsadas]);
    }

    static fetchVacacionesRestantes(nomina) {
        return db.execute('SELECT vacacionesTotalesAux FROM empleado WHERE idEmpleado =?', [nomina]);
    }

    static borrarSolicitudConStatus(idEmpleado, idSol, vacUsadas){
        return db.execute('CALL cancelarVacacionesAceptadas(?, ? ,?)', [idEmpleado, idSol, vacUsadas]);
    }

    static borrarSolicitudSinStatus(idEmpleado, idSolicitud, vacUsadas) {
        return db.execute('CALL cancelarVacacionesSinEstatus(?, ?, ?)', [idEmpleado, idSolicitud, vacUsadas])
    }

    static fetchAll(nomina) {
        return db.execute ('SELECT * FROM solicitudvacaciones WHERE idEmpleado=? ORDER BY idSolicitud DESC', [nomina]);
    }

    static fetchAllVacaciones() {
        return db.execute ("SELECT idSolicitud, e.idEmpleado AS 'solicita', e.nombre AS 'nomSolicita', e.apellidoPaterno AS 'apellidoPatSolicita', e.apellidoMaterno AS 'apellidoMatSolicita', sv.fechaInicio, sv.fechaFin, sv.fechaReanudacion, sv.fechaSolicitud, sv.suplente, sv.solicitudAceptadaEstatus, d.idLider, f.nombre AS 'nomLider', f.apellidoPaterno AS 'apellidoPatLider', f.apellidoMaterno AS 'apellidoMatLider', Nota FROM solicitudvacaciones sv, empleado e, empleado f, dirige d WHERE sv.idEmpleado = e.idEmpleado AND d.idOperador = e.idEmpleado AND d.idLider = f.idEmpleado AND solicitudAceptadaEstatus IS NOT NULL ORDER BY fechaSolicitud DESC;");
    }

    static fetchLider(nomina) {
        return db.execute('SELECT d.idLider, nombre, apellidoPaterno, apellidoMaterno FROM empleado e, dirige d WHERE e.idEmpleado=d.idLider AND idOperador=?', [nomina]);
    }

    static fetchSolVacParaLider(nomina) {
        return db.execute ('SELECT idSolicitud, solicitudvacaciones.idEmpleado, fechaSolicitud, fechaReanudacion, suplente, solicitudAceptadaEstatus, fechaInicio, fechaFin, nombre, apellidoPaterno, apellidoMaterno ' +
                               'FROM solicitudvacaciones, empleado ' +
                               'WHERE solicitudvacaciones.idEmpleado = empleado.idEmpleado AND solicitudAceptadaEstatus IS NULL AND solicitudvacaciones.idEmpleado ' +
                               'IN (SELECT idOperador ' +
                                    'FROM DIRIGE D ' +
                                    'WHERE idLider = ?)', [nomina]);
    }

    static fetchMisVacaciones(nomina) {
        return db.execute ('SELECT * FROM solicitudvacaciones WHERE idEmpleado=? ORDER BY fechaSolicitud ASC', [nomina]);
    }

    static fetchSolicitud(solicitudId){
        return db.execute ('SELECT idSolicitud, e.idEmpleado, fechaInicio, fechaFin, fechaReanudacion, fechaSolicitud, suplente, solicitudAceptadaEstatus, Nota, nombre, apellidoPaterno, apellidoMaterno FROM solicitudvacaciones sv, empleado e WHERE sv.idEmpleado = e.idEmpleado AND idSolicitud = ?', [solicitudId]);
    }

    static aceptarVacas(idSolicitud, vacasUsadas,idEmpleado){
        return db.execute('CALL Modificar_Estatus_Vacas_Aceptar(?,?,?)', [idSolicitud,vacasUsadas,idEmpleado]);
    }

    static rechazarVacas(idSolicitud, nota, vacacionesUsadas){
        return db.execute('CALL Modificar_Estatus_Vacas_Rechazar(?,?,?)', [idSolicitud, nota, vacacionesUsadas]);
    }

    // Funcion Filtrar solicitudes de vacaciones por Mes
    static filtraSolVacacionesMes(anio, mes, mesar) {
        if (mesar == 'Enero' || mesar == 'Febrero' || mesar == 'Marzo' || mesar == 'Abril' || mesar == 'Mayo' || mesar == 'Junio' || mesar == 'Julio' || mesar == 'Agosto' || mesar == 'Septiembre' || mesar == 'Octubre' || mesar == 'Noviembre' || mesar == 'Diciembre') {
            return db.execute("SELECT idSolicitud, e.idEmpleado AS 'solicita', e.nombre AS 'nomSolicita', e.apellidoPaterno AS 'apellidoPatSolicita', e.apellidoMaterno AS 'apellidoMatSolicita', sv.fechaInicio, sv.fechaFin, sv.fechaReanudacion, sv.fechaSolicitud, sv.suplente, sv.solicitudAceptadaEstatus, d.idLider, f.nombre AS 'nomLider', f.apellidoPaterno AS 'apellidoPatLider', f.apellidoMaterno AS 'apellidoMatLider' FROM solicitudvacaciones sv, empleado e, empleado f, dirige d WHERE sv.idEmpleado = e.idEmpleado AND d.idOperador = e.idEmpleado AND d.idLider = f.idEmpleado AND sv.fechaInicio BETWEEN '"+anio+"-"+mes+"-01' AND '"+anio+"-"+mes+"-31' AND solicitudAceptadaEstatus IS NOT NULL;");
        } else {
            return db.execute("SELECT sv.idSolicitud, sv.idEmpleado AS 'solicita', e.nombre AS 'nomSolicita', e.apellidoPaterno AS 'apellidoPatSolicita', e.apellidoMaterno AS 'apellidoMatSolicita', " +
                "sv.fechaSolicitud, sv.solicitudAceptadaEstatus, sv.fechaInicio, sv.fechaFin, sv.fechaReanudacion, sv.suplente, " +
                "d.idLider, l.nombre AS 'nomLider', l.apellidoPaterno AS 'apellidoPatLider', l.apellidoMaterno AS 'apellidoMatLider' " +
                "FROM empleado e, empleado l, solicitudvacaciones sv, dirige d " +
                "WHERE e.idEmpleado = sv.idEmpleado AND e.idEmpleado = d.idOperador AND solicitudAceptadaEstatus IS NOT NULL AND l.idEmpleado = d.idLider AND sv.idEmpleado IN " +
                "(SELECT ae.idEmpleado " +
                "FROM area_empleado ae, area a " +
                "WHERE ae.idArea = a.idArea AND ae.idArea = ?)", [mesar]);
        }
    }

    // Funcion Obtener Áreas de Natgas
    static fetchAreas(){
        return db.execute('SELECT * FROM area');
    }
}