const Banners = require('../models/models_banners');

exports.vistaGeneral = (request, response, next) => {
    let today = Date.now();
    // let dateStr = today.getFullYear() + '-' + ("0" + today.getMonth()).slice(-2) + '-' + ("0" + today.getDate()).slice(-2);
    Banners.fetchAllBanners()
    .then(([rows, fieldData]) => {
        const banners = rows;
        console.log(request.body);
        console.log(request.session.empleado);
        console.log(request.session.rol);
        console.log(request.session.privilegios);
        response.render('general/general', {
            sesion: request.session.empleado,
            rol: request.session.rol,
            privilegios: request.session.privilegios,
            banners: banners,
            today: today
        });
    }).catch((err) => {
            console.log(err);
        });
};
