const Banners = require('../models/models_banners');

exports.vistaGeneral = (request, response, next) => {
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
            banners: banners
        });
    }).catch((err) => {
            console.log(err);
        });
};
