const db = require('../util/database');

module.exports = class solicitudVacaciones {

    constructor(fechaInicio, fechaFin, suplente) {
        this.fechaInicio = fechaInicio;
        this.fechaFin = fechaFin;
        this.suplente = suplente;
    }

    saveSolicitud() {
        return db.execute('INSERT INTO solicitudvacaciones (idEmpleado, fechaInicio, fechaFin, suplente) VALUES (?, ?, ?, ?)', [90954, this.fechaInicio, this.fechaFin, this.suplente]);
    }

    // static fetchAllAdmin(){
    //     return db.execute(
    //         'SELECT * FROM solicitudvacaciones'
    //     );
    // }


    // static fetchAllLider(){
    //     return db.execute(
    //     );
    // }
    


}