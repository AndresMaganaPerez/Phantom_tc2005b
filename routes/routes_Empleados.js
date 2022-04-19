const express = require('express');

const router = express.Router();
const isAuthAdminRH = require('../controllers/is-authAdminRH');
const isAuthLider = require('../controllers/is-authLider');
const isAuthOperador = require('../controllers/is-authOperador');
const isAuth = require('../controllers/is-auth');
const controller_empleado = require('../controllers/controller_empleados');

router.get('/registrar_empleados', isAuth, controller_empleado.formEmpleados);

router.post('/registrar_empleados', isAuth, controller_empleado.registrarEmpleado);

router.get('/empleados_registrados', isAuth, controller_empleado.empleadosExistentes);

module.exports = router;