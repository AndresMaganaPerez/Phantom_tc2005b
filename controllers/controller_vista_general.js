exports.vistaGeneral = (request, response, next) => {
    console.log(request.body);
    response.render('generalAdmin');
};

exports.perfil = (request, response, next) => {
    console.log(request.body);
    response.render('vistaPerfilAdmin');
};
