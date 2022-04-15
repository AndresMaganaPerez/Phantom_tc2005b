const db = require('../util/database')

module.exports = class NGB {
    constructor(_nomina,_fecha){
        this.nomina = _nomina;
        this.fecha = _fecha;
    }
    save_NGB() {
        return db.execute('INSERT INTO natgasblocks (idEmpleado,fechaUsoNGB) VALUES (?,?)',
        [this.nomina,this.fecha])
    }
    /*static getNGBRestantes(_nomina){
        return db.execute('SELECT cantidadNatgasBlocks FROM empleado WHERE idEmpleado=?',[_nomina])
    }*/
    static RestaNGBRestantes(_nomina){
        return db.execute('UPDATE empleado SET cantidadNatgasBlocks = cantidadNatgasBlocks - 1 WHERE idEmpleado =?',[_nomina])
    }
    static getUltimaSolcitud(_nomina){
        return db.execute('SELECT fechaSolicitud FROM natgasblocks WHERE idEmpleado =? ORDER BY fechaSolicitud DESC LIMIT 1',[_nomina])
    }
static getNGBDeMisEmpleados(_nomina){
        return db.execute('SELECT idNatgasBlocks, natgasblocks.idEmpleado, fechaSolicitud,fechaUsoNGB,nombre,apellidoPaterno,apellidoMaterno FROM natgasblocks, empleado WHERE natgasblocks.idEmpleado = empleado.idEmpleado AND natgasblocks.idEmpleado IN (SELECT idOperador FROM DIRIGE D WHERE idLider =?)',[_nomina])
    }
/*static getNombreDeEmpleado(_nomina){
    return db.execute('SELECT nombre, apellidoPaterno, apellidoMaterno FROM empleado WHERE idEmpleado=?',[_nomina])
}*/
    static fetchAll(){
        return db.execute('SELECT vqs.Quien_solicita, vqs.qsApellidoPaterno, vqs.qsApellidoMaterno, vl.Lider, vl.lApellidoPaterno, vl.lApellidoMaterno, ngb.idNatgasBlocks, ngb.fechaSolicitud, ngb.fechaUsoNGB FROM viewquiensolicita as vqs, viewlider vl, natgasblocks as ngb WHERE vqs.idNGB = vl.idNGB AND ngb.idNatgasBlocks = vqs.idNGB AND ngb.idNatgasBlocks = vl.idNGB AND ngb.estatusNGB = 1;')
    }

    static fetchNGBPorAceptar(_nomina){
        return db.execute('SELECT * FROM solicitudesngb as sngb WHERE Lider IN (SELECT e.nombre FROM DIRIGE d, empleado e WHERE d.idLider = e.idEmpleado AND d.idLider =?) AND sngb.estatusNGB IS NULL;',[_nomina])
    }

    static aceptarNGB(idqs, idngb){
        return db.execute('CALL AceptarRestarNGB(?, ?)',[idqs, idngb])
    }

    // Funcion Filtrar solicitudes de Natgas Block por Mes
    static filtraSolNGBMes(mes) {
        if (mes == 'Enero') {
            return db.execute("SELECT idNatgasBlocks, e.idEmpleado AS 'solicita', e.nombre AS 'Quien_Solicita', e.apellidoPaterno AS 'qsApellidoPaterno', e.apellidoMaterno AS 'qsApellidoMaterno', ng.fechaUsoNGB, ng.fechaSolicitud, ng.estatusNGB, d.idLider, f.nombre AS 'nomLider', f.apellidoPaterno AS 'lApellidoPaterno', f.apellidoMaterno AS 'lApellidoMaterno' FROM natgasblocks ng, empleado e, empleado f, dirige d WHERE ng.idEmpleado = e.idEmpleado AND d.idOperador = e.idEmpleado AND d.idLider = f.idEmpleado AND ng.fechaUsoNGB BETWEEN '2022-01-01' AND '2022-01-31' AND estatusNGB IS NOT NULL;");
        } else if (mes == 'Febrero') {
            return db.execute("SELECT idNatgasBlocks, e.idEmpleado AS 'solicita', e.nombre AS 'Quien_Solicita', e.apellidoPaterno AS 'qsApellidoPaterno', e.apellidoMaterno AS 'qsApellidoMaterno', ng.fechaUsoNGB, ng.fechaSolicitud, ng.estatusNGB, d.idLider, f.nombre AS 'nomLider', f.apellidoPaterno AS 'lApellidoPaterno', f.apellidoMaterno AS 'lApellidoMaterno' FROM natgasblocks ng, empleado e, empleado f, dirige d WHERE ng.idEmpleado = e.idEmpleado AND d.idOperador = e.idEmpleado AND d.idLider = f.idEmpleado AND ng.fechaUsoNGB BETWEEN '2022-02-01' AND '2022-02-31' AND estatusNGB IS NOT NULL;");
        } else if (mes == 'Marzo') {
            return db.execute("SELECT idNatgasBlocks, e.idEmpleado AS 'solicita', e.nombre AS 'Quien_Solicita', e.apellidoPaterno AS 'qsApellidoPaterno', e.apellidoMaterno AS 'qsApellidoMaterno', ng.fechaUsoNGB, ng.fechaSolicitud, ng.estatusNGB, d.idLider, f.nombre AS 'nomLider', f.apellidoPaterno AS 'lApellidoPaterno', f.apellidoMaterno AS 'lApellidoMaterno' FROM natgasblocks ng, empleado e, empleado f, dirige d WHERE ng.idEmpleado = e.idEmpleado AND d.idOperador = e.idEmpleado AND d.idLider = f.idEmpleado AND ng.fechaUsoNGB BETWEEN '2022-03-01' AND '2022-03-31' AND estatusNGB IS NOT NULL;");
        } else if (mes == 'Abril') {
            return db.execute("SELECT idNatgasBlocks, e.idEmpleado AS 'solicita', e.nombre AS 'Quien_Solicita', e.apellidoPaterno AS 'qsApellidoPaterno', e.apellidoMaterno AS 'qsApellidoMaterno', ng.fechaUsoNGB, ng.fechaSolicitud, ng.estatusNGB, d.idLider, f.nombre AS 'nomLider', f.apellidoPaterno AS 'lApellidoPaterno', f.apellidoMaterno AS 'lApellidoMaterno' FROM natgasblocks ng, empleado e, empleado f, dirige d WHERE ng.idEmpleado = e.idEmpleado AND d.idOperador = e.idEmpleado AND d.idLider = f.idEmpleado AND ng.fechaUsoNGB BETWEEN '2022-04-01' AND '2022-04-31' AND estatusNGB IS NOT NULL;");
        } else if (mes == 'Mayo') {
            return db.execute("SELECT idNatgasBlocks, e.idEmpleado AS 'solicita', e.nombre AS 'Quien_Solicita', e.apellidoPaterno AS 'qsApellidoPaterno', e.apellidoMaterno AS 'qsApellidoMaterno', ng.fechaUsoNGB, ng.fechaSolicitud, ng.estatusNGB, d.idLider, f.nombre AS 'nomLider', f.apellidoPaterno AS 'lApellidoPaterno', f.apellidoMaterno AS 'lApellidoMaterno' FROM natgasblocks ng, empleado e, empleado f, dirige d WHERE ng.idEmpleado = e.idEmpleado AND d.idOperador = e.idEmpleado AND d.idLider = f.idEmpleado AND ng.fechaUsoNGB BETWEEN '2022-05-01' AND '2022-05-31' AND estatusNGB IS NOT NULL;");
        } else if (mes == 'Junio') {
            return db.execute("SELECT idNatgasBlocks, e.idEmpleado AS 'solicita', e.nombre AS 'Quien_Solicita', e.apellidoPaterno AS 'qsApellidoPaterno', e.apellidoMaterno AS 'qsApellidoMaterno', ng.fechaUsoNGB, ng.fechaSolicitud, ng.estatusNGB, d.idLider, f.nombre AS 'nomLider', f.apellidoPaterno AS 'lApellidoPaterno', f.apellidoMaterno AS 'lApellidoMaterno' FROM natgasblocks ng, empleado e, empleado f, dirige d WHERE ng.idEmpleado = e.idEmpleado AND d.idOperador = e.idEmpleado AND d.idLider = f.idEmpleado AND ng.fechaUsoNGB BETWEEN '2022-06-01' AND '2022-06-31' AND estatusNGB IS NOT NULL;");
        } else if (mes == 'Julio') {
            return db.execute("SELECT idNatgasBlocks, e.idEmpleado AS 'solicita', e.nombre AS 'Quien_Solicita', e.apellidoPaterno AS 'qsApellidoPaterno', e.apellidoMaterno AS 'qsApellidoMaterno', ng.fechaUsoNGB, ng.fechaSolicitud, ng.estatusNGB, d.idLider, f.nombre AS 'nomLider', f.apellidoPaterno AS 'lApellidoPaterno', f.apellidoMaterno AS 'lApellidoMaterno' FROM natgasblocks ng, empleado e, empleado f, dirige d WHERE ng.idEmpleado = e.idEmpleado AND d.idOperador = e.idEmpleado AND d.idLider = f.idEmpleado AND ng.fechaUsoNGB BETWEEN '2022-07-01' AND '2022-07-31' AND estatusNGB IS NOT NULL;");
        } else if (mes == 'Agosto') {
            return db.execute("SELECT idNatgasBlocks, e.idEmpleado AS 'solicita', e.nombre AS 'Quien_Solicita', e.apellidoPaterno AS 'qsApellidoPaterno', e.apellidoMaterno AS 'qsApellidoMaterno', ng.fechaUsoNGB, ng.fechaSolicitud, ng.estatusNGB, d.idLider, f.nombre AS 'nomLider', f.apellidoPaterno AS 'lApellidoPaterno', f.apellidoMaterno AS 'lApellidoMaterno' FROM natgasblocks ng, empleado e, empleado f, dirige d WHERE ng.idEmpleado = e.idEmpleado AND d.idOperador = e.idEmpleado AND d.idLider = f.idEmpleado AND ng.fechaUsoNGB BETWEEN '2022-08-01' AND '2022-08-31' AND estatusNGB IS NOT NULL;");
        } else if (mes == 'Septiembre') {
            return db.execute("SELECT idNatgasBlocks, e.idEmpleado AS 'solicita', e.nombre AS 'Quien_Solicita', e.apellidoPaterno AS 'qsApellidoPaterno', e.apellidoMaterno AS 'qsApellidoMaterno', ng.fechaUsoNGB, ng.fechaSolicitud, ng.estatusNGB, d.idLider, f.nombre AS 'nomLider', f.apellidoPaterno AS 'lApellidoPaterno', f.apellidoMaterno AS 'lApellidoMaterno' FROM natgasblocks ng, empleado e, empleado f, dirige d WHERE ng.idEmpleado = e.idEmpleado AND d.idOperador = e.idEmpleado AND d.idLider = f.idEmpleado AND ng.fechaUsoNGB BETWEEN '2022-09-01' AND '2022-09-31' AND estatusNGB IS NOT NULL;");
        } else if (mes == 'Octubre') {
            return db.execute("SELECT idNatgasBlocks, e.idEmpleado AS 'solicita', e.nombre AS 'Quien_Solicita', e.apellidoPaterno AS 'qsApellidoPaterno', e.apellidoMaterno AS 'qsApellidoMaterno', ng.fechaUsoNGB, ng.fechaSolicitud, ng.estatusNGB, d.idLider, f.nombre AS 'nomLider', f.apellidoPaterno AS 'lApellidoPaterno', f.apellidoMaterno AS 'lApellidoMaterno' FROM natgasblocks ng, empleado e, empleado f, dirige d WHERE ng.idEmpleado = e.idEmpleado AND d.idOperador = e.idEmpleado AND d.idLider = f.idEmpleado AND ng.fechaUsoNGB BETWEEN '2022-10-01' AND '2022-10-31' AND estatusNGB IS NOT NULL;");
        } else if (mes == 'Noviembre') {
            return db.execute("SELECT idNatgasBlocks, e.idEmpleado AS 'solicita', e.nombre AS 'Quien_Solicita', e.apellidoPaterno AS 'qsApellidoPaterno', e.apellidoMaterno AS 'qsApellidoMaterno', ng.fechaUsoNGB, ng.fechaSolicitud, ng.estatusNGB, d.idLider, f.nombre AS 'nomLider', f.apellidoPaterno AS 'lApellidoPaterno', f.apellidoMaterno AS 'lApellidoMaterno' FROM natgasblocks ng, empleado e, empleado f, dirige d WHERE ng.idEmpleado = e.idEmpleado AND d.idOperador = e.idEmpleado AND d.idLider = f.idEmpleado AND ng.fechaUsoNGB BETWEEN '2022-11-01' AND '2022-11-31' AND estatusNGB IS NOT NULL;");
        } else if (mes == 'Diciembre') {
            return db.execute("SELECT idNatgasBlocks, e.idEmpleado AS 'solicita', e.nombre AS 'Quien_Solicita', e.apellidoPaterno AS 'qsApellidoPaterno', e.apellidoMaterno AS 'qsApellidoMaterno', ng.fechaUsoNGB, ng.fechaSolicitud, ng.estatusNGB, d.idLider, f.nombre AS 'nomLider', f.apellidoPaterno AS 'lApellidoPaterno', f.apellidoMaterno AS 'lApellidoMaterno' FROM natgasblocks ng, empleado e, empleado f, dirige d WHERE ng.idEmpleado = e.idEmpleado AND d.idOperador = e.idEmpleado AND d.idLider = f.idEmpleado AND ng.fechaUsoNGB BETWEEN '2022-12-01' AND '2022-12-31' AND estatusNGB IS NOT NULL;");
        }
    }
}