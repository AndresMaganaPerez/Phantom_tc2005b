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
                


                Reportes.fetchAll(mes, year).then(([rowsIndicadores, fieldData]) => {
                    console.log(rowsIndicadores);
                    //Para sacar lo del mes anterior y hacer comparacion
                    Reportes.fetchAll(previousMonth, year).then(([rowsAnterior, fieldData]) =>{
                        console.log("MES ANTERIOR");
                        console.log(rowsAnterior);
                        // console.log(rowsAnterior[0].Valor)

                        Reportes.fetchUltimos6NPS(mesStart, mesEnd, previousYear, year).then(([npss, fieldData]) =>{
                            console.log("Imprimiendo ultimos 6 NPS")
                            while(npss.length < 6){
                                npss.unshift({
                                    Valor: 0
                                });
                            }
                            console.log(npss);
                            const ultimos6npss = npss; 

                            Reportes.fetchUltimos6ENPS(mesStart, mesEnd, previousYear, year).then(([enpss, fieldData]) =>{
                                console.log("Imprimiendo ultimos 6 ENPS")
                                while(enpss.length < 6){
                                    enpss.unshift({
                                        Valor: 0
                                    });
                                }
                                console.log(enpss);
                                const ultimos6enpss = enpss; 

                                Reportes.fetchUltimos6CO2(mesStart, mesEnd, previousYear, year).then(([co2s, fieldData]) =>{
                                    console.log("Imprimiendo ultimos 6 CO2")
                                    while(co2s.length < 6){
                                        co2s.unshift({
                                            Valor: 0
                                        });
                                    }
                                    console.log(co2s);
                                    const ultimos6co2s = co2s; 

                                    Reportes.fetchUltimos6Hombres(mesStart, mesEnd, previousYear, year).then(([hombres, fieldData]) =>{
                                        console.log("Imprimiendo ultimos 6 Hombres")
                                        while(hombres.length < 6){
                                            hombres.unshift({
                                                Valor: 0
                                            });
                                        }
                                        console.log(hombres);
                                        const ultimos6hombres = hombres; 
                

                                        Reportes.fetchUltimos6Mujeres(mesStart, mesEnd, previousYear, year).then(([mujeres, fieldData]) =>{
                                            console.log("Imprimiendo ultimos 6 Mujeres")
                                            while(mujeres.length < 6){
                                                mujeres.unshift({
                                                    Valor: 0
                                                });
                                            }
                                            console.log(mujeres);
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
