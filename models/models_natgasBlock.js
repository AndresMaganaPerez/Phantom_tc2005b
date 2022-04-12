const db = require('../util/database')

module.exports = class NGB {
    constructor(_nomina,_fecha){
        this.nomina = _nomina;
        this.fecha = _fecha;
    }
    save_NGB() {
        return db.execute('INSERT INTO natgasblocks (idEmpleado,fechaSolicitud) VALUES (?,?)',
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
        return db.execute('SELECT * FROM natgasblocks WHERE idEmpleado IN (SELECT idOperador FROM DIRIGE D WHERE idLider =?)',[_nomina])
    }
}