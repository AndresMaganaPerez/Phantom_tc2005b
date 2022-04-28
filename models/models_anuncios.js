const db = require('../util/database');

module.exports = class Anuncios {
    constructor(_fecha, _titulo, _pin, _expiracion, _texto, _img) {
        this.fecha = _fecha;
        this.titulo = _titulo;
        this.pin = 0;
        if (_pin == 'on') {
            this.pin = 1;
        };
        this.expiracion = _expiracion;
        this.texto = _texto;
        this.image = _img;
    }

    saveAnuncio() {
        return db.execute('CALL agregarAnuncio(?, ?, ?, ?, ?, ?)', [this.fecha, this.titulo, this.pin, this.expiracion, this.texto, this.image]);
    }

    static borrarAnuncio(idAnuncio) {
        return db.execute('DELETE FROM solicitudvacaciones WHERE idAnuncios=?', [idAnuncio]);
    }

    static fetchAllPinned(hoy) {
        return db.execute ('SELECT a.IdAnuncios, Titulo, texto, Fecha, expiracion, Pin, recursoDigital FROM anuncios a, anuncios_recurso_digital ard, recurso_digital rd WHERE a.IdAnuncios = ard.idAnuncios AND rd.idRecursoDigital = ard.idRecursoDigital AND Pin = 1 AND expiracion >= "'+hoy+'" ORDER BY Fecha DESC');
    }

    static fetchAllUnpinned(hoy) {
        return db.execute ('SELECT a.IdAnuncios, Titulo, texto, Fecha, expiracion, Pin, recursoDigital FROM anuncios a, anuncios_recurso_digital ard, recurso_digital rd WHERE a.IdAnuncios = ard.idAnuncios AND rd.idRecursoDigital = ard.idRecursoDigital AND Pin = 0 AND expiracion >= "'+hoy+'" ORDER BY Fecha DESC');
    }

    static fetchLastPin(hoy) {
        return db.execute('SELECT * FROM anuncios WHERE Pin = 1 AND expiracion >= "'+hoy+'" ORDER BY Fecha DESC LIMIT 5');
    }

    static fetchLastUnpin(hoy) {
        return db.execute('SELECT * FROM anuncios WHERE Pin = 0 AND expiracion >= "'+hoy+'" ORDER BY Fecha DESC LIMIT 5');
    }
}