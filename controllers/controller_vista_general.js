exports.vistaGeneral = (request, response, next) => {
    console.log(request.body);
    response.render('generalPromJF');
};
