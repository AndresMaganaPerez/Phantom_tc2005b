const db = require('../util/database');

module.exports = class Banners {
    constructor(img, exp) {
        this.imagen = img;
        this.expiracion = exp;
    }
    saveBanners() {
        return db.execute('CALL agregarBanner(?, ?)',[this.expiracion, this.imagen]);
    }
    static fetchAllBanners() {
        return db.execute('SELECT b.idBanner, expiracion, fechaRegistro, recursoDigital FROM banners b, banners_recurso_digital br, recurso_digital rd WHERE b.idBanner = br.idBanner AND rd.idRecursoDigital = br.idRecursoDigital');
    }
}