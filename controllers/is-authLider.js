module.exports = (request, response, next) => {
    if (!request.session.isLoggedIn) {
        return response.redirect('/');
    }
    if (request.session.rol != 'lider') {
        return response.redirect('/NoExiste');
    }
    next();
}