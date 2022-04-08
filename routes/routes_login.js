const express = require('express');

const router = express.Router();

const controllersEmpleados = require('../controllers/controller_empleados');

router.get('/', controllersEmpleados.login_Signup);

router.post('/', controllersEmpleados.postSignUp);



module.exports = router;