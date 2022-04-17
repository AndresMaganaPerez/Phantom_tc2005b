const db = require('../util/database');

module.exports = class Banners {
    constructor(img, exp, fecha) {
        this.imagen = img;
        this.expiracion = exp;
        this.fechas = fecha;
    }
    saveBanners() {
        return db.execute('CALL agregarBanner(?, ?, ?)',[this.expiracion, this.fechas, this.imagen]);
    }
    static fetchAllBanners() {
        return db.execute('SELECT b.idBanner, expiracion, fecha, recursoDigital FROM banners b, banners_recurso_digital br, recurso_digital rd WHERE b.idBanner = br.idBanner AND rd.idRecursoDigital = br.idRecursoDigital');
    }
}