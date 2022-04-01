const db = require('../util/database');

module.exports = class Empleado {

    constructor(idEmpleado, email, nombre, apellidoPaterno, apellidoMaterno, fechaNac, 
        fechaIngr, numTelefonico, cantidadNatgasBlocks, antiguedad, vacacionesTotales, 
        numVacacionesLey, numVacacionesPremio, plaza ) {

        this.idEmpleado = idEmpleado;
        this.email = email;
        this.nombre = nombre;
        this.apellidoPaterno = apellidoPaterno;
        this.apellidoMaterno = apellidoMaterno;
        this.fechaNac = fechaNac;
        this.fechaIngr = fechaIngr;
        this.numTelefonico = numTelefonico;
        this.cantidadNatgasBlocks = cantidadNatgasBlocks;
        this.antiguedad = antiguedad;
        this.vacacionesTotales = vacacionesTotales;
        this.numVacacionesLey = numVacacionesLey;
        this.numVacacionesPremio = numVacacionesPremio;
        this.plaza = plaza;
    }

    saveSolicitud() {
        
    }

    static fetchAllAdmin(){
        return db.execute(
            
        );
    }


    static fetchAllLider(){
        return db.execute(
            
        );
    }
    


}