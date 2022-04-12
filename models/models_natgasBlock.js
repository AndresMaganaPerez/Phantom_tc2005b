const db = require('../util/database')

module.exports = class NGB {
    constructor(_nomina,_fecha){
        this.nomina = _nomina;
        this.fecha = _fecha;
    }
    save_NGB() {
        return db.execute('INSERT INTO natgasblocks (empleadoID,fechaSolicitud) VALUES (?,?)',
        [this.nomina,this.fecha])
    }
    /*static getNGBRestantes(_nomina){
        return db.execute('SELECT cantidadNatgasBlocks FROM empleado WHERE idEmpleado=?',[_nomina])
    }*/
    static RestaNGBRestantes(_nomina){
        return db.execute('UPDATE empleado SET cantidadNatgasBlocks = cantidadNatgasBlocks - 1 WHERE idEmpleado =?',[_nomina])
    }
}