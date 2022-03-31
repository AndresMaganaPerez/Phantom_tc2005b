exports.anuncios = (request, response, next) => {
    console.log("Anuncios");
    response.render('anunciosOperador');
};

exports.nuevoAnuncio = (requrest, respone, next) => {
    console.log('Crear nuevo anuncio');
}; 