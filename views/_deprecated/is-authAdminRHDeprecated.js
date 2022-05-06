module.exports = (request, response, next) => {
    if (!request.session.isLoggedIn) {
        return response.redirect('/');
    }
    if (request.session.rol != 'admin' || request.session.rol != 'recursosHumanos') {
        return response.redirect('/NoExiste');
    }
    next();
}