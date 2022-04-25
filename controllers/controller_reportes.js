const { filtraSolNGBMes } = require('../models/models_natgasBlock');
const Reportes = require('../models/models_reportes');

exports.reportes = (request, response, next) => {
    const month = ["01","02","03","04","05","06","07","08","09","10","11","12"];
    const meses = ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"];
    const d = new Date();
    let mes = month[d.getMonth()];
    let previousMonth = mes -1;
    if(month[d.getMonth()] == 01){
        previousMonth = 12;
    }
    

    const resta = mes-6

    console.log(resta)
    const aux = []
    const auxMeses = []
    if(resta < 1){
        for(i=0; i < month.slice(resta).length; i++){
            console.log("Hello")
            console.log(month.slice(resta)[i])
            aux.push(month.slice(resta)[i])
        }
        
        for(i=0; i < mes; i++){
            aux.push(month[i]);
        }
        console.log(aux)
        for(i=0; i<aux.length; i++){
            auxMeses.push(meses[aux[i]-1])
        }
        console.log(auxMeses)
    } else{
        for(i=resta; i < mes; i++){
            console.log("Hello")
            aux.push(month[i])
        }
        console.log(aux)
    }
    console.log("El mesStar: "+aux[0]);
    const mesStart = aux[0];
    console.log("El mesEnd: "+aux[aux.length - 1])
    const mesEnd = aux[aux.length - 1];

    console.log("El mes anterior es: "+previousMonth)
    let nombreMes = meses[d.getMonth()];

    const y = new Date();
    let year = d.getFullYear();

    let previousYear = 0;
    if(mesStart >= 8 && mesStart <=12){
        previousYear = year - 1;
    }else{
        previousYear = year;
    }
    console.log(previousYear)
    


    Reportes.fetchAll(mes, year).then(([rows, fieldData]) => {
        console.log(rows);
        //Para sacar lo del mes anterior y hacer comparacion
        Reportes.fetchAll(previousMonth, year).then(([rowsAnterior, fieldData]) =>{
            console.log("MES ANTERIOR");
            console.log(rowsAnterior);
            // console.log(rowsAnterior[0].Valor)

            Reportes.fetchUltimos6NPS(mesStart, mesEnd, previousYear, year).then(([npss, fieldData]) =>{
                console.log("Imprimiendo ultimos 6 NPS")
                while(npss.length < 6){
                    npss.push({
                        Valor: 0
                    });
                }
                console.log(npss.reverse());
                const ultimos6npss = npss; 

                Reportes.fetchUltimos6ENPS(mesStart, mesEnd, previousYear, year).then(([enpss, fieldData]) =>{
                    console.log("Imprimiendo ultimos 6 ENPS")
                    while(enpss.length < 6){
                        enpss.push({
                            Valor: 0
                        });
                    }
                    console.log(enpss.reverse());
                    const ultimos6enpss = enpss; 

                    Reportes.fetchUltimos6CO2(mesStart, mesEnd, previousYear, year).then(([co2s, fieldData]) =>{
                        console.log("Imprimiendo ultimos 6 CO2")
                        while(co2s.length < 6){
                            co2s.push({
                                Valor: 0
                            });
                        }
                        console.log(co2s.reverse());
                        const ultimos6co2s = co2s; 

                        Reportes.fetchUltimos6Hombres(mesStart, mesEnd, previousYear, year).then(([hombres, fieldData]) =>{
                            console.log("Imprimiendo ultimos 6 Hombres")
                            while(hombres.length < 6){
                                hombres.push({
                                    Valor: 0
                                });
                            }
                            console.log(hombres.reverse());
                            const ultimos6hombres = hombres; 
    

                            Reportes.fetchUltimos6Mujeres(mesStart, mesEnd, previousYear, year).then(([mujeres, fieldData]) =>{
                                console.log("Imprimiendo ultimos 6 Mujeres")
                                while(mujeres.length < 6){
                                    mujeres.push({
                                        Valor: 0
                                    });
                                }
                                console.log(mujeres.reverse());
                                const ultimos6mujeres = mujeres; 
        
                                response.render('reportes/consultarReportes',{
                                    sesion: request.session.empleado,
                                    rol: request.session.rol,
                                    privilegios: request.session.privilegios,
                                    indicadores: rows,
                                    mesAnterior: rowsAnterior,
                                    nombreMes: nombreMes,
                                    npss: ultimos6npss,
                                    enpss: ultimos6enpss,
                                    co2s: ultimos6co2s,
                                    hombres: ultimos6hombres,
                                    mujeres: ultimos6mujeres,
                                    meses: auxMeses
                                }); 
                            }).catch((error) => {
                                console.log(error);
                                response.send('<h1>Todavia no hay 6 meses</h1>');
                            });

                        }).catch((error) => {
                            console.log(error);
                            response.send('<h1>Todavia no hay 6 meses</h1>');
                        });

                    }).catch((error) => {
                        console.log(error);
                        response.send('<h1>Todavia no hay 6 meses</h1>');
                    });


                }).catch((error) => {
                    console.log(error);
                    response.send('<h1>Todavia no hay 6 meses</h1>');
                });

                
            }).catch((error) => {
                console.log(error);
                response.send('<h1>Todavia no hay 6 meses</h1>');
            });


            
        }).catch((error) => {
            console.log(error);
        });
        
    }).catch(err => {
        console.log(err)
    });
    console.log("Reportes");
};

exports.nuevo_reporte = (request, response, next) => {
    console.log("Nuevo Reporte");
    Reportes.fecthTipos().then(([rows, fieldData]) => {
        console.log("All from tabla tipo_indicadores")
        console.log(rows);
        response.render('reportes/crearReporte',{
            sesion: request.session.empleado,
            rol: request.session.rol,
            privilegios: request.session.privilegios,
            indicadores: rows,
            flag: 0
        });
    }).catch((error) => {
        console.log(error);
    });

};

exports.post_nuevo_reporte = (request, response, next) => {
    const month = ["01","02","03","04","05","06","07","08","09","10","11","12"];
    const d = new Date();
    let mes = month[d.getMonth()];

    const y = new Date();
    let year = d.getFullYear();
    let dia = d.getDate();

    console.log("Le diste click a Enviar");
    console.log("Tipo elegido: " + request.body.tipoIndicador.substring(0,2));
    console.log("Valor Ingresado: " + request.body.valorIndicador);
    const id = request.body.tipoIndicador.substring(0,2);
    const fecha = year+"-"+mes+"-"+dia;
    Reportes.fetchExistentes(id, mes, year).then(([rows, fieldData]) => {
        console.log(rows);//Aqui me consolea si ya existe un reporte de ese tipo en el mes
        if(rows < 1){ //Si no hay reporte de ese tipo en el mes
            flag = 1;
            //El siguiente metodo es para que el dropdown del render de este post funcione
            Reportes.fecthTipos().then(([rows, fieldData]) => {
                filas = rows
            }).catch((error) => {
                console.log(error);
            });
        
            Reportes.saveIndicador(id, request.body.valorIndicador, fecha, flag)
            .then(() => {
                console.log("Indicador Fue Posteado!")
                response.render('reportes/crearReporte',{
                    sesion: request.session.empleado,
                    rol: request.session.rol,
                    privilegios: request.session.privilegios,
                    indicadores: filas,
                    flag: flag  //FLAG EN LA VISTA PARA MENSAJE DE PUBLICADO
                });
            }).catch((error) => {
                console.log(error);
            });
        } else if (rows = 1){
            flag = "ERROR";
            //El siguiente metodo es para que el dropdown del render de este post funcione
            Reportes.fecthTipos().then(([rows, fieldData]) => {
                filas = rows
            }).catch((error) => {
                console.log(error);
            });
            console.log("Ya hay un indicador de este tipo para este mes!");
            response.render('reportes/crearReporte',{
                sesion: request.session.empleado,
                rol: request.session.rol,
                privilegios: request.session.privilegios,
                indicadores: filas,
                flag: flag  //FLAG EN LA VISTA PARA MENSAJE DE PUBLICADO
            });
        }
    }).catch((error) => {
        console.log(error);
    });

}

exports.modificar_reporte = (request, response, next) => {
    console.log("Modificar Reporte");
    response.render('reportes/modificarReporte',{
        sesion: request.session.empleado,
        rol: request.session.rol,
        privilegios: request.session.privilegios
    });
};