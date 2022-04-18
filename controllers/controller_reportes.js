const { filtraSolNGBMes } = require('../models/models_natgasBlock');
const Reportes = require('../models/models_reportes');

exports.reportes = (request, response, next) => {
    const month = ["01","02","03","04","05","06","07","08","09","10","11","12"];
    const meses = ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"];
    const d = new Date();
    let mes = month[d.getMonth()];
    let nombreMes = meses[d.getMonth()];

    const y = new Date();
    let year = d.getFullYear();

    Reportes.fetchAll(mes, year).then(([rows, fieldData]) => {
        console.log(rows);
        //Para sacar lo del mes anterior y hacer comparacion
        Reportes.fetchAll(mes-1, year).then(([rowsAnterior, fieldData]) =>{
            console.log("MES ANTERIOR");
            console.log(rowsAnterior);
            console.log(rowsAnterior[0].Valor)
            response.render('reportes/consultarReportes',{
                sesion: request.session.empleado,
                rol: request.session.rol,
                privilegios: request.session.privilegios,
                indicadores: rows,
                mesAnterior: rowsAnterior,
                valorAnterior: rowsAnterior[0].Valor,
                nombreMes: nombreMes
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