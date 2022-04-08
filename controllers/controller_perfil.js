
exports.perfil = (request, response, next) => {
    console.log(request.body);
    response.render('vistaPerfilLider');
};