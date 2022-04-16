const db = require('../util/database');

module.exports = class Anuncios {
    constructor(_id, _fecha, _titulo, _pin, _expiracion, _texto) {
        this.id = _id;
        this.fecha = _fecha;
        this.titulo = _titulo;
        this.pin = _pin;
        this.expiracion = _expiracion;
        this.texto = _texto;
    }

    saveAnuncio() {
        return db.execute('INSERT INTO anuncios (Fecha, Titulo, Pin, expiracion, texto) VALUES (?, ?, ?, ?, ?)', [this.fecha, this.titulo, this.pin, this.expiracion, this.texto]);
    }

    static borrarAnuncio(idAnuncio) {
        return db.execute('DELETE FROM solicitudvacaciones WHERE idAnuncios=?', [idAnuncio]);
    }

    static fetchAll() {
        return db.execute ('SELECT * FROM anuncios ORDER BY Fecha DESC');
    }
}