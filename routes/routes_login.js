const express = require('express');

const router = express.Router();

const controllersEmpleados = require('../controllers/controller_empleados');
const isAuth = require('../controllers/is-auth');

router.get('/', controllersEmpleados.signup);

router.post('/', controllersEmpleados.postSignUp);

router.get('/login',controllersEmpleados.getLogin);

router.post('/login',controllersEmpleados.login);

router.get('/logout', controllersEmpleados.logout);

module.exports = router;