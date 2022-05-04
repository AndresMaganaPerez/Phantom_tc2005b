const db = require('../util/database');

module.exports = class Anuncios {
    constructor(_fecha, _titulo, _pin, _expiracion, _texto, _img, _eliminado) {
        this.fecha = _fecha;
        this.titulo = _titulo;
        this.pin = 0;
        if (_pin == 'on') {
            this.pin = 1;
        };
        this.expiracion = _expiracion;
        this.texto = _texto;
        this.image = _img;
        this.eliminado = _eliminado;
    }

    saveAnuncio() {
        return db.execute('CALL agregarAnuncio(?, ?, ?, ?, ?, ?, ?)', [this.fecha, this.titulo, this.pin, this.expiracion, this.texto, this.image, this.eliminado]);
    }

    static modificarAnuncio(idAnuncio, idRecurso, fecha, titulo, pin, expiracion, texto, imagen) {
        return db.execute('CALL modificarAnuncio(?, ?, ?, ?, ?, ?, ?, ?)', [idAnuncio, idRecurso, fecha, titulo, pin, expiracion, texto, imagen]);
    }

    static eliminarAnuncio(idAnuncio) {
        return db.execute('UPDATE anuncios SET eliminado = 1 WHERE idAnuncios=?', [idAnuncio]);
    }

    static modAnuncio(idAnuncio) {
        return db.execute('SELECT a.IdAnuncios, Titulo, texto, Fecha, expiracion, Pin, eliminado, rd.idRecursoDigital as idRec, recursoDigital FROM anuncios a, anuncios_recurso_digital ard, recurso_digital rd WHERE a.IdAnuncios=?', [idAnuncio]);
    }

    static fetchAllPinned(hoy) {
        return db.execute ('SELECT a.IdAnuncios, Titulo, texto, Fecha, expiracion, Pin, eliminado, rd.idRecursoDigital as idRec, recursoDigital FROM anuncios a, anuncios_recurso_digital ard, recurso_digital rd WHERE a.IdAnuncios = ard.idAnuncios AND rd.idRecursoDigital = ard.idRecursoDigital AND Pin = 1 AND expiracion >= "'+hoy+'" AND eliminado = 0 ORDER BY Fecha DESC');
    }

    static fetchAllUnpinned(hoy) {
        return db.execute ('SELECT a.IdAnuncios, Titulo, texto, Fecha, expiracion, Pin, eliminado, rd.idRecursoDigital as idRec, recursoDigital FROM anuncios a, anuncios_recurso_digital ard, recurso_digital rd WHERE a.IdAnuncios = ard.idAnuncios AND rd.idRecursoDigital = ard.idRecursoDigital AND Pin = 0 AND expiracion >= "'+hoy+'" AND eliminado = 0 ORDER BY Fecha DESC');
    }

    static fetchLastPin(hoy) {
        return db.execute('SELECT a.IdAnuncios, Titulo, texto, Fecha, expiracion, Pin, eliminado, recursoDigital FROM anuncios a, anuncios_recurso_digital ard, recurso_digital rd WHERE a.IdAnuncios = ard.idAnuncios AND rd.idRecursoDigital = ard.idRecursoDigital AND Pin = 1 AND expiracion >= "'+hoy+'" AND eliminado = 0 ORDER BY Fecha DESC LIMIT 5');
    }

    static fetchLastUnpin(hoy) {
        return db.execute('SELECT a.IdAnuncios, Titulo, texto, Fecha, expiracion, Pin, eliminado, recursoDigital FROM anuncios a, anuncios_recurso_digital ard, recurso_digital rd WHERE a.IdAnuncios = ard.idAnuncios AND rd.idRecursoDigital = ard.idRecursoDigital AND Pin = 0 AND expiracion >= "'+hoy+'" AND eliminado = 0 ORDER BY Fecha DESC LIMIT 5');
    }
}