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

}