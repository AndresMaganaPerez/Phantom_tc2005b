const db = require('../util/database')

module.exports = class Reportes {
    constructor(_idValor,_valor,_fecha){
        this.idValor = _idValor;
        this.valor = _valor;
        this.fecha = _fecha;
    }

    static fecthTipos(){
        return db.execute('SELECT * FROM tipo_indicador');
    }

    static fetchExistentes(id, mes, anio){
        return db.execute("SELECT * FROM valor_indicador WHERE TipoIndicadorID ="+id+" and fecha BETWEEN '"+anio+"-"+mes+"-01' AND '"+anio+"-"+mes+"-31';");
    }

    static saveIndicador(id, valor, fecha, flag){
        return db.execute('CALL agregarIndicador(?,?,?,?)',[id, valor, fecha, flag]);
    }


    static fetchAll(mes, anio) {
        return db.execute("SELECT * FROM valor_indicador WHERE fecha BETWEEN '"+anio+"-"+mes+"-01' AND '"+anio+"-"+mes+"-31' AND TipoIndicadorID = 1 or TipoIndicadorID = 2 AND fecha BETWEEN '"+anio+"-"+mes+"-01' AND '"+anio+"-"+mes+"-31' or TipoIndicadorID = 3 AND fecha BETWEEN '"+anio+"-"+mes+"-01' AND '"+anio+"-"+mes+"-31' or TipoIndicadorID = 4 AND fecha BETWEEN '"+anio+"-"+mes+"-01' AND '"+anio+"-"+mes+"-31' or TipoIndicadorID = 5 AND fecha BETWEEN '"+anio+"-"+mes+"-01' AND '"+anio+"-"+mes+"-31';");
    }



}