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

    static fetchUltimos6NPS(mesStart, mesEnd, previousYear, anio){
        return db.execute("SELECT * FROM valor_indicador WHERE TipoIndicadorID=1 AND fecha BETWEEN '"+previousYear+"-"+mesStart+"-01' AND '"+anio+"-"+mesEnd+"-31'")
    }

    static fetchUltimos6ENPS(mesStart, mesEnd, previousYear, anio){
        return db.execute("SELECT * FROM valor_indicador WHERE TipoIndicadorID=2 AND fecha BETWEEN '"+previousYear+"-"+mesStart+"-01' AND '"+anio+"-"+mesEnd+"-31'")
    }

    static fetchUltimos6CO2(mesStart, mesEnd, previousYear, anio){
        return db.execute("SELECT * FROM valor_indicador WHERE TipoIndicadorID=3 AND fecha BETWEEN '"+previousYear+"-"+mesStart+"-01' AND '"+anio+"-"+mesEnd+"-31'")
    }

    static fetchUltimos6Hombres(mesStart, mesEnd, previousYear, anio){
        return db.execute("SELECT * FROM valor_indicador WHERE TipoIndicadorID=4 AND fecha BETWEEN '"+previousYear+"-"+mesStart+"-01' AND '"+anio+"-"+mesEnd+"-31'")
    }

    static fetchUltimos6Mujeres(mesStart, mesEnd, previousYear, anio){
        return db.execute("SELECT * FROM valor_indicador WHERE TipoIndicadorID=5 AND fecha BETWEEN '"+previousYear+"-"+mesStart+"-01' AND '"+anio+"-"+mesEnd+"-31'")
    }


}