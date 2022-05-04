const { filtraSolNGBMes } = require('../models/models_natgasBlock');
const Reportes = require('../models/models_reportes');

exports.reportes = (request, response, next) => {
    const month = ["01","02","03","04","05","06","07","08","09","10","11","12"];
    const meses = ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"];
    const d = new Date();
    let mes = month[d.getMonth()] -1 ; //-1 porque en abril se va a ver el del mes pasado. Porque no se puede ver Abril en abril, ya que no ha pasado el mes. La logica no da. No pueden tener un indicador de un mes que no ha acabado.
    let previousMonth = mes -1;
    if(month[d.getMonth()] == 01){
        previousMonth = 11;
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
    let nombreMes = meses[d.getMonth()-1]; //-1 por el problema de logica de que no pueden ser del mes presente ya que no ha acabado y no tiene logica que registren indicador de un mes que no ha acabado.

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
            const mesAnteriorAux = [];
            for(indiAnterior of rowsAnterior){
                mesAnteriorAux.push(indiAnterior.TipoIndicadorID);
            }
            console.log(mesAnteriorAux);

            // console.log(rowsAnterior[0].Valor)

            Reportes.fetchUltimos6NPS(mesStart, mesEnd, previousYear, year).then(([npss, fieldData]) =>{
                console.log("Imprimiendo ultimos 6 NPS")
                const fechaAuxNPS = [];
                console.log("FECHAAAA"+npss[0].fecha)
                for(nps of npss){
                    const auxFecha = nps.fecha.getMonth();
                    console.log("aaaaaaaaaaaaaaaaaaaaaa" + nps.fecha.getMonth());
                    fechaAuxNPS.push(auxFecha);
                }
                console.log("FECHA AUX: "+fechaAuxNPS);
                console.log("MESSS" + (mes-1));
                console.log("CONDICIONNN"+ fechaAuxNPS.includes(mes-1))
                if(fechaAuxNPS.includes(mes-1) == false){
                    npss.push({
                        Valor: 0
                    });
                    rows.push({
                        TipoIndicadorID: 1
                    })
                }
                while(npss.length < 6){
                    npss.unshift({
                        Valor: 0
                    });
                }
                console.log(npss);
                const ultimos6npss = npss; 

                Reportes.fetchUltimos6ENPS(mesStart, mesEnd, previousYear, year).then(([enpss, fieldData]) =>{
                    console.log("Imprimiendo ultimos 6 ENPS")
                    const fechaAuxENPS = [];
                    console.log("FECHAAAA"+enpss[0].fecha)
                    for(enps of enpss){
                        const auxFecha = enps.fecha.getMonth();
                        console.log("aaaaaaaaaaaaaaaaaaaaaa" + enps.fecha.getMonth());
                        fechaAuxENPS.push(auxFecha);
                    }
                    console.log("FECHA AUX: "+fechaAuxENPS);
                    console.log("MESSS" + (mes-1));
                    console.log("CONDICIONNN"+ fechaAuxENPS.includes(mes-1))
                    if(fechaAuxENPS.includes(mes-1) == false){
                        enpss.push({
                            Valor: 0
                        });
                        rows.push({
                            TipoIndicadorID: 2
                        })
                    }
                    while(enpss.length < 6){
                        enpss.unshift({
                            Valor: 0
                        });
                    }
                    console.log(enpss);
                    const ultimos6enpss = enpss; 

                    Reportes.fetchUltimos6CO2(mesStart, mesEnd, previousYear, year).then(([co2s, fieldData]) =>{
                        console.log("Imprimiendo ultimos 6 CO2")
                        const fechaAuxCO2 = [];
                        console.log("FECHAAAA"+co2s[0].fecha)
                        console.log(co2s[0].fecha.getDate())
                        for(co2 of co2s){
                            const auxFecha = co2.fecha.getMonth();
                            console.log("aaaaaaaaaaaaaaaaaaaaaa" + co2.fecha.getMonth());
                            fechaAuxCO2.push(auxFecha);
                        }
                        console.log("FECHA AUX: "+fechaAuxCO2);
                        console.log("MESSS" + (mes-1));
                        console.log("CONDICIONNN"+ fechaAuxCO2.includes(mes-1))
                        if(fechaAuxCO2.includes(mes-1) == false){
                            co2s.push({
                                Valor: 0
                            });
                            rows.push({
                                TipoIndicadorID: 3
                            })
                        }
                        while(co2s.length < 6){
                            co2s.unshift({
                                Valor: 0
                            });
                        }
                        console.log(co2s);
                        const ultimos6co2s = co2s;

                        Reportes.fetchUltimos6Hombres(mesStart, mesEnd, previousYear, year).then(([hombres, fieldData]) =>{
                            console.log("Imprimiendo ultimos 6 Hombres")
                            const fechaAuxHOMBRE = [];
                            console.log("FECHAAAA"+hombres[0].fecha)
                            console.log(hombres[0].fecha.getDate())
                            for(hombre of hombres){
                                const auxFecha = hombre.fecha.getMonth();
                                console.log("aaaaaaaaaaaaaaaaaaaaaa" + hombre.fecha.getMonth());
                                fechaAuxHOMBRE.push(auxFecha);
                            }
                            console.log("FECHA AUX: "+fechaAuxHOMBRE);
                            console.log("MESSS" + (mes-1));
                            console.log("CONDICIONNN"+ fechaAuxHOMBRE.includes(mes-1))
                            if(fechaAuxHOMBRE.includes(mes-1) == false){
                                hombres.push({
                                    Valor: 0
                                });
                                rows.push({
                                    TipoIndicadorID: 4
                                })
                            }
                            while(hombres.length < 6){
                                hombres.unshift({
                                    Valor: 0
                                });
                            }
                            console.log(hombres);
                            const ultimos6hombres = hombres; 
    

                            Reportes.fetchUltimos6Mujeres(mesStart, mesEnd, previousYear, year).then(([mujeres, fieldData]) =>{
                                console.log("Imprimiendo ultimos 6 Mujeres")
                                const fechaAuxMUJER = [];
                                console.log("FECHAAAA"+mujeres[0].fecha)
                                console.log(mujeres[0].fecha.getDate())
                                for(mujer of mujeres){
                                    const auxFecha = mujer.fecha.getMonth();
                                    console.log("aaaaaaaaaaaaaaaaaaaaaa" + mujer.fecha.getMonth());
                                    fechaAuxMUJER.push(auxFecha);
                                }
                                console.log("FECHA AUX: "+fechaAuxMUJER);
                                console.log("MESSS" + (mes-1));
                                console.log("CONDICIONNN"+ fechaAuxMUJER.includes(mes-1))
                                if(fechaAuxMUJER.includes(mes-1) == false){
                                    mujeres.push({
                                        Valor: 0
                                    });
                                    rows.push({
                                        TipoIndicadorID: 5
                                    })
                                }
                                while(mujeres.length < 6){
                                    mujeres.unshift({
                                        Valor: 0
                                    });
                                }
                                console.log(mujeres);
                                const ultimos6mujeres = mujeres; 

                                Reportes.fecthTipos().then(([rowsTipos, fieldData]) => {

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
                                        meses: auxMeses,
                                        tipos: rowsTipos,
                                        nombreIndicador: "fail"
                                    }); 

                                }).catch((error) =>{
                                    console.log(error);
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
    let mes = month[d.getMonth()]-1;

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
                const filas = rows
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
            }).catch((error) => {
                console.log(error);
            });
        } else if (rows = 1){
            flag = "ERROR";
            //El siguiente metodo es para que el dropdown del render de este post funcione
            Reportes.fecthTipos().then(([rows, fieldData]) => {
                const filas = rows
                console.log("Ya hay un indicador de este tipo para este mes!");
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
        }
    }).catch((error) => {
        console.log(error);
    });

}

exports.modificar_reporte = (request, response, next) => {
    console.log("Modificar Reporte");
    const idIndicador = request.params.idIndicador = '' ? '' : request.params.idIndicador;
    console.log("ID del Indicador a Editar: " + idIndicador)
    Reportes.fectchValorEditar(idIndicador).then(([rows, fieldData]) => {
        console.log(rows);
        console.log("Valor Actual del Indicador elegido: " + rows[0].Valor)
        response.render('reportes/modificarReporte',{
            sesion: request.session.empleado,
            rol: request.session.rol,
            privilegios: request.session.privilegios,
            valor: rows[0].Valor,
            flag: "fail",
            idIndicador: idIndicador
        });
    }).catch((err) => {
        console.log(err);
    });
    
};

exports.post_modificar_reporte = (request, response, next) => {
    const idIndicador = request.body.idIndicador;
    const valor = request.body.valor
    const valorNuevo = request.body.nuevoValor;
    console.log(idIndicador)
    console.log(valor)
    console.log(valorNuevo)
    flag = "success"
    Reportes.updateValor(idIndicador, valorNuevo).then(([rows, fieldData]) => {
        response.render('reportes/modificarReporte',{
            sesion: request.session.empleado,
            rol: request.session.rol,
            privilegios: request.session.privilegios,
            valorNuevo: valorNuevo,
            flag: flag,
            valor: valor,
            idIndicador: idIndicador
        });
    }).catch((err) => {
        console.log(err);
    });

    
};


exports.filtrarIndicadorNombre = (request, response, next) => {
   const nombreIndicador = request.params.nombre = '' ? '' : request.params.nombre == 'Hombres' ? 'Hombres y Mujeres' : request.params.nombre;

   const arr_indicadores = ["NPS", "ENPS", "Reducción de CO2", "Hombres", "Mujeres"];

   let idIndicador = arr_indicadores.indexOf(nombreIndicador) + 1;

   

   console.log("Id del Indicador es: " + idIndicador)

   console.log("El indicador por el que deseas filtrar es: " + nombreIndicador);


   const month = ["01","02","03","04","05","06","07","08","09","10","11","12"];
    const meses = ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"];
    const d = new Date();
    let mes = month[d.getMonth()] -1 ; //-1 porque en abril se va a ver el del mes pasado. Porque no se puede ver Abril en abril, ya que no ha pasado el mes. La logica no da. No pueden tener un indicador de un mes que no ha acabado.
    let previousMonth = mes -1;
    if(month[d.getMonth()] == 01){
        previousMonth = 11;
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
    let nombreMes = meses[d.getMonth()-1]; //-1 por el problema de logica de que no pueden ser del mes presente ya que no ha acabado y no tiene logica que registren indicador de un mes que no ha acabado.

    const y = new Date();
    let year = d.getFullYear();

    let previousYear = 0;
    if(mesStart >= 8 && mesStart <=12){
        previousYear = year - 1;
    }else{
        previousYear = year;
    }
    console.log(previousYear)


//    const y = new Date();
//    const year = y.getFullYear();
//    const mes = y.getMonth() -1;

    Reportes.fetchAll(mes, year).then(([rows, fieldData]) => {
        console.log(rows);
        //Para sacar lo del mes anterior y hacer comparacion
        Reportes.fetchAll(previousMonth, year).then(([rowsAnterior, fieldData]) =>{
            console.log("MES ANTERIOR");
            console.log(rowsAnterior);
            const mesAnteriorAux = [];
            for(indiAnterior of rowsAnterior){
                mesAnteriorAux.push(indiAnterior.TipoIndicadorID);
            }
            console.log(mesAnteriorAux);
            // console.log(rowsAnterior[0].Valor)

            Reportes.fetchUltimos6NPS(mesStart, mesEnd, previousYear, year).then(([npss, fieldData]) =>{
                console.log("Imprimiendo ultimos 6 NPS")
                const fechaAuxNPS = [];
                console.log("FECHAAAA"+npss[0].fecha)
                for(nps of npss){
                    const auxFecha = nps.fecha.getMonth();
                    console.log("aaaaaaaaaaaaaaaaaaaaaa" + nps.fecha.getMonth());
                    fechaAuxNPS.push(auxFecha);
                }
                console.log("FECHA AUX: "+fechaAuxNPS);
                console.log("MESSS" + (mes-1));
                console.log("CONDICIONNN"+ fechaAuxNPS.includes(mes-1))
                if(fechaAuxNPS.includes(mes-1) == false){
                    npss.push({
                        Valor: 0
                    });
                    rows.push({
                        TipoIndicadorID: 1
                    })
                }
                while(npss.length < 6){
                    npss.unshift({
                        Valor: 0
                    });
                }
                console.log(npss);
                const ultimos6npss = npss; 

                Reportes.fetchUltimos6ENPS(mesStart, mesEnd, previousYear, year).then(([enpss, fieldData]) =>{
                    console.log("Imprimiendo ultimos 6 ENPS")
                    const fechaAuxENPS = [];
                    console.log("FECHAAAA"+enpss[0].fecha)
                    for(enps of enpss){
                        const auxFecha = enps.fecha.getMonth();
                        console.log("aaaaaaaaaaaaaaaaaaaaaa" + enps.fecha.getMonth());
                        fechaAuxENPS.push(auxFecha);
                    }
                    console.log("FECHA AUX: "+fechaAuxENPS);
                    console.log("MESSS" + (mes-1));
                    console.log("CONDICIONNN"+ fechaAuxENPS.includes(mes-1))
                    if(fechaAuxENPS.includes(mes-1) == false){
                        enpss.push({
                            Valor: 0
                        });
                        rows.push({
                            TipoIndicadorID: 2
                        })
                    }
                    while(enpss.length < 6){
                        enpss.unshift({
                            Valor: 0
                        });
                    }
                    console.log(enpss);
                    const ultimos6enpss = enpss; 

                    Reportes.fetchUltimos6CO2(mesStart, mesEnd, previousYear, year).then(([co2s, fieldData]) =>{
                        console.log("Imprimiendo ultimos 6 CO2")
                        const fechaAuxCO2 = [];
                        console.log("FECHAAAA"+co2s[0].fecha)
                        console.log(co2s[0].fecha.getDate())
                        for(co2 of co2s){
                            const auxFecha = co2.fecha.getMonth();
                            console.log("aaaaaaaaaaaaaaaaaaaaaa" + co2.fecha.getMonth());
                            fechaAuxCO2.push(auxFecha);
                        }
                        console.log("FECHA AUX: "+fechaAuxCO2);
                        console.log("MESSS" + (mes-1));
                        console.log("CONDICIONNN"+ fechaAuxCO2.includes(mes-1))
                        if(fechaAuxCO2.includes(mes-1) == false){
                            co2s.push({
                                Valor: 0
                            });
                            rows.push({
                                TipoIndicadorID: 3
                            })
                        }
                        while(co2s.length < 6){
                            co2s.unshift({
                                Valor: 0
                            });
                        }
                        console.log(co2s);
                        const ultimos6co2s = co2s;

                        Reportes.fetchUltimos6Hombres(mesStart, mesEnd, previousYear, year).then(([hombres, fieldData]) =>{
                            console.log("Imprimiendo ultimos 6 Hombres")
                            const fechaAuxHOMBRE = [];
                            console.log("FECHAAAA"+hombres[0].fecha)
                            console.log(hombres[0].fecha.getDate())
                            for(hombre of hombres){
                                const auxFecha = hombre.fecha.getMonth();
                                console.log("aaaaaaaaaaaaaaaaaaaaaa" + hombre.fecha.getMonth());
                                fechaAuxHOMBRE.push(auxFecha);
                            }
                            console.log("FECHA AUX: "+fechaAuxHOMBRE);
                            console.log("MESSS" + (mes-1));
                            console.log("CONDICIONNN"+ fechaAuxHOMBRE.includes(mes-1))
                            if(fechaAuxHOMBRE.includes(mes-1) == false){
                                hombres.push({
                                    Valor: 0
                                });
                                rows.push({
                                    TipoIndicadorID: 4
                                })
                            }
                            while(hombres.length < 6){
                                hombres.unshift({
                                    Valor: 0
                                });
                            }
                            console.log(hombres);
                            const ultimos6hombres = hombres; 


                            Reportes.fetchUltimos6Mujeres(mesStart, mesEnd, previousYear, year).then(([mujeres, fieldData]) =>{
                                console.log("Imprimiendo ultimos 6 Mujeres")
                                const fechaAuxMUJER = [];
                                console.log("FECHAAAA"+mujeres[0].fecha)
                                console.log(mujeres[0].fecha.getDate())
                                for(mujer of mujeres){
                                    const auxFecha = mujer.fecha.getMonth();
                                    console.log("aaaaaaaaaaaaaaaaaaaaaa" + mujer.fecha.getMonth());
                                    fechaAuxMUJER.push(auxFecha);
                                }
                                console.log("FECHA AUX: "+fechaAuxMUJER);
                                console.log("MESSS" + (mes-1));
                                console.log("CONDICIONNN"+ fechaAuxMUJER.includes(mes-1))
                                if(fechaAuxMUJER.includes(mes-1) == false){
                                    mujeres.push({
                                        Valor: 0
                                    });
                                    rows.push({
                                        TipoIndicadorID: 5
                                    })
                                }
                                while(mujeres.length < 6){
                                    mujeres.unshift({
                                        Valor: 0
                                    });
                                }
                                console.log(mujeres);
                                const ultimos6mujeres = mujeres; 

                                Reportes.fecthTipos().then(([rowsTipos, fieldData]) => {

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
                                        meses: auxMeses,
                                        tipos: rowsTipos,
                                        nombreIndicador: nombreIndicador
                                    }); 

                                }).catch((error) =>{
                                    console.log(error);
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