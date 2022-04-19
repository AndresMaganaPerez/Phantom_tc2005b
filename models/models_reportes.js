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
<<<<<<< HEAD
        return db.execute("SELECT * FROM valor_indicador WHERE fecha BETWEEN '"+anio+"-"+mes+"-01' AND '"+anio+"-"+mes+"-31' AND TipoIndicadorID = 1 or TipoIndicadorID = 2 AND fecha BETWEEN '"+anio+"-"+mes+"-01' AND '"+anio+"-"+mes+"-31' or TipoIndicadorID = 3 AND fecha BETWEEN '"+anio+"-"+mes+"-01' AND '"+anio+"-"+mes+"-31' or TipoIndicadorID = 4 AND fecha BETWEEN '"+anio+"-"+mes+"-01' AND '"+anio+"-"+mes+"-31' or TipoIndicadorID = 5 AND fecha BETWEEN '"+anio+"-"+mes+"-01' AND '"+anio+"-"+mes+"-31';");
=======
        return db.execute("SELECT * FROM valor_indicador WHERE fecha BETWEEN '"+anio+"-"+mes+"-01' AND '"+anio+"-"+mes+"-31' AND TipoIndicadorID = 1 or TipoIndicadorID = 2 AND fecha BETWEEN '"+anio+"-"+mes+"-01' AND '"+anio+"-"+mes+"-31' or TipoIndicadorID = 3 AND fecha BETWEEN '"+anio+"-"+mes+"-01' AND '"+anio+"-"+mes+"-31' or TipoIndicadorID = 4 AND fecha BETWEEN '"+anio+"-"+mes+"-01' AND '"+anio+"-"+mes+"-31';");
>>>>>>> Alex/ConsultarUsuarios


        // if (mes == '01') {
        //     return db.execute("SELECT * FROM valor_indicador WHERE TipoIndicadorID = 1 AND fecha BETWEEN '"+anio+"-"+mes+"-01' AND '"+anio+"-"+mes+"-01';");
        // } else if (mes == '02') {
        //     return db.execute("SELECT * FROM valor_indicador WHERE TipoIndicadorID = 1 AND fecha BETWEEN '2021-02-01' AND '2021-02-31';");
        // } else if (mes == '03') {
        //     return db.execute("SELECT * FROM valor_indicador WHERE TipoIndicadorID = 1 AND fecha BETWEEN '2021-03-01' AND '2021-03-31';");
        // } else if (mes == '04') {
        //     return db.execute("SELECT * FROM valor_indicador WHERE TipoIndicadorID = 1 AND fecha BETWEEN '2021-04-01' AND '2021-04-31';");
        // } else if (mes == '05') {
        //     return db.execute("SELECT * FROM valor_indicador WHERE TipoIndicadorID = 1 AND fecha BETWEEN '2021-05-01' AND '2021-05-31';");
        // } else if (mes == '06') {
        //     return db.execute("SELECT * FROM valor_indicador WHERE TipoIndicadorID = 1 AND fecha BETWEEN '2021-06-01' AND '2021-06-31';");
        // } else if (mes == '07') {
        //     return db.execute("SELECT * FROM valor_indicador WHERE TipoIndicadorID = 1 AND fecha BETWEEN '2021-07-01' AND '2021-07-31';");
        // } else if (mes == '08') {
        //     return db.execute("SELECT * FROM valor_indicador WHERE TipoIndicadorID = 1 AND fecha BETWEEN '2021-08-01' AND '2021-08-31';");
        // } else if (mes == '09') {
        //     return db.execute("SELECT * FROM valor_indicador WHERE TipoIndicadorID = 1 AND fecha BETWEEN '2021-09-01' AND '2021-09-31';");
        // } else if (mes == '10') {
        //     return db.execute("SELECT * FROM valor_indicador WHERE TipoIndicadorID = 1 AND fecha BETWEEN '2021-10-01' AND '2021-10-31';");
        // } else if (mes == '11') {
        //     return db.execute("SELECT * FROM valor_indicador WHERE TipoIndicadorID = 1 AND fecha BETWEEN '2021-11-01' AND '2021-11-31';");
        // } else if (mes == '12') {
        //     return db.execute("SELECT * FROM valor_indicador WHERE TipoIndicadorID = 1 AND fecha BETWEEN '2021-12-01' AND '2021-12-31';");
        // } 
    }



}