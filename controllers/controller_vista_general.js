const Banners = require('../models/models_banners');
const Anuncio = require('../models/models_anuncios');
const Reportes = require('../models/models_reportes');

exports.vistaGeneral = (request, response, next) => {
    let today = Date.now();
    let date= new Date();
    let mes = date.getMonth() + 1;
    let dateStr = date.getFullYear() + '-' + ("0" + mes).slice(-2) + '-' + ("0" + date.getDate()).slice(-2);
    //let dateStr = today.getFullYear() + '-' + ("0" + today.getMonth()).slice(-2) + '-' + ("0" + today.getDate()).slice(-2);
    Banners.fetchAllBanners(dateStr).then(([rows, fieldData]) => {
        Anuncio.fetchLastPin(dateStr).then(([rowsPin, fieldData]) => {

            Anuncio.fetchLastUnpin(dateStr).then(([rowsUnPin, fieldData]) => {
                const banners = rows;
                console.log(request.body);
                console.log(request.session.empleado);
                console.log(request.session.rol);
                console.log(request.session.privilegios);

                const month = ["01","02","03","04","05","06","07","08","09","10","11","12"];
                const meses = ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"];
                const d = new Date();
                let mes = month[d.getMonth()] -1; //-1 por logica de mes en vida real
                let previousMonth = mes -1;
                if(month[d.getMonth()] == 01){
                    previousMonth = 11;
                }
                

                const resta = mes-6
                const aux = []
                const auxMeses = []
                if(resta < 1){
                    for(i=0; i < month.slice(resta).length; i++){
                        aux.push(month.slice(resta)[i])
                    }
                    
                    for(i=0; i < mes; i++){
                        aux.push(month[i]);
                    }
                    for(i=0; i<aux.length; i++){
                        auxMeses.push(meses[aux[i]-1])
                    }
                } else{
                    for(i=resta; i < mes; i++){
                        aux.push(month[i])
                    }
                }
                const mesStart = aux[0];
                const mesEnd = aux[aux.length - 1];

                let nombreMes = meses[d.getMonth()];

                const y = new Date();
                let year = d.getFullYear();

                let previousYear = 0;
                if(mesStart >= 8 && mesStart <=12){
                    previousYear = year - 1;
                }else{
                    previousYear = year;
                }

                Reportes.fetchAll(mes, year).then(([rowsIndicadores, fieldData]) => {
                    //Para sacar lo del mes anterior y hacer comparacion
                    Reportes.fetchAll(previousMonth, year).then(([rowsAnterior, fieldData]) =>{
                        const mesAnteriorAux = [];
                        for(indiAnterior of rowsAnterior){
                            mesAnteriorAux.push(indiAnterior.TipoIndicadorID);
                        }
                        Reportes.fetchUltimos6NPS(mesStart, mesEnd, previousYear, year).then(([npss, fieldData]) =>{
                            const fechaAuxNPS = [];
                            for(nps of npss){
                                const auxFecha = nps.fecha.getMonth();
                                fechaAuxNPS.push(auxFecha);
                            }
                            if(fechaAuxNPS.includes(mes-1) == false){
                                npss.push({
                                    Valor: 0
                                });
                                rowsIndicadores.push({
                                    TipoIndicadorID: 1
                                })
                            }
                            while(npss.length < 6){
                                npss.unshift({
                                    Valor: 0
                                });
                            }
                            const ultimos6npss = npss; 

                            Reportes.fetchUltimos6ENPS(mesStart, mesEnd, previousYear, year).then(([enpss, fieldData]) =>{
                                const fechaAuxENPS = [];
                                for(enps of enpss){
                                    const auxFecha = enps.fecha.getMonth();
                                    fechaAuxENPS.push(auxFecha);
                                }
                                if(fechaAuxENPS.includes(mes-1) == false){
                                    enpss.push({
                                        Valor: 0
                                    });
                                    rowsIndicadores.push({
                                        TipoIndicadorID: 2
                                    })
                                }
                                while(enpss.length < 6){
                                    enpss.unshift({
                                        Valor: 0
                                    });
                                }
                                const ultimos6enpss = enpss; 

                                Reportes.fetchUltimos6CO2(mesStart, mesEnd, previousYear, year).then(([co2s, fieldData]) =>{
                                    const fechaAuxCO2 = [];
                                    for(co2 of co2s){
                                        const auxFecha = co2.fecha.getMonth();
                                        fechaAuxCO2.push(auxFecha);
                                    }
                                    if(fechaAuxCO2.includes(mes-1) == false){
                                        co2s.push({
                                            Valor: 0
                                        });
                                        rowsIndicadores.push({
                                            TipoIndicadorID: 3
                                        })
                                    }
                                    while(co2s.length < 6){
                                        co2s.unshift({
                                            Valor: 0
                                        });
                                    }
                                    const ultimos6co2s = co2s; 

                                    Reportes.fetchUltimos6Hombres(mesStart, mesEnd, previousYear, year).then(([hombres, fieldData]) =>{
                                        const fechaAuxHOMBRE = [];
                                        for(hombre of hombres){
                                            const auxFecha = hombre.fecha.getMonth();
                                            fechaAuxHOMBRE.push(auxFecha);
                                        }
                                        if(fechaAuxHOMBRE.includes(mes-1) == false){
                                            hombres.push({
                                                Valor: 0
                                            });
                                            rowsIndicadores.push({
                                                TipoIndicadorID: 4
                                            })
                                        }
                                        while(hombres.length < 6){
                                            hombres.unshift({
                                                Valor: 0
                                            });
                                        }
                                        const ultimos6hombres = hombres; 
                

                                        Reportes.fetchUltimos6Mujeres(mesStart, mesEnd, previousYear, year).then(([mujeres, fieldData]) =>{
                                            const fechaAuxMUJER = [];
                                            for(mujer of mujeres){
                                                const auxFecha = mujer.fecha.getMonth();
                                                fechaAuxMUJER.push(auxFecha);
                                            }
                                            if(fechaAuxMUJER.includes(mes-1) == false){
                                                mujeres.push({
                                                    Valor: 0
                                                });
                                                rowsIndicadores.push({
                                                    TipoIndicadorID: 5
                                                })
                                            }
                                            while(mujeres.length < 6){
                                                mujeres.unshift({
                                                    Valor: 0
                                                });
                                            }
                                            const ultimos6mujeres = mujeres; 
                    

                                            response.render('general/general', {
                                                sesion: request.session.empleado,
                                                rol: request.session.rol,
                                                privilegios: request.session.privilegios,
                                                banners: banners,
                                                today: today,
                                                indicadores: rowsIndicadores,
                                                mesAnterior: rowsAnterior,
                                                nombreMes: nombreMes,
                                                npss: ultimos6npss,
                                                enpss: ultimos6enpss,
                                                co2s: ultimos6co2s,
                                                hombres: ultimos6hombres,
                                                mujeres: ultimos6mujeres,
                                                meses: auxMeses,
                                                anuncioPin: rowsPin,
                                                anuncioUnpin: rowsUnPin,
                                            });
                                        });
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
    }).catch(err => {
        console.log(err)
    });
};
