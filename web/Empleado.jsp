<%-- 
    Document   : Empleado
    Created on : 20/07/2023, 01:52:27 PM
    Author     : informatica
    --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <title>Empleados</title>
    <style>
        .required-label {
            display: flex;
            gap: .75rem;
        }

        .required-label::before {
            content: "*";
            color: red;
        }
    </style>
</head>
<body>
<nav class="d-flex justify-between align-items-center bg-danger p-3">
    <ul class="d-flex align-items-center mb-0 gap-3 list-unstyled flex-grow-1 ">
        <li>
            <a class="btn btn-outline-light" aria-current="page" href="Controlador?menu=Home">Home
            </a>
        </li>
        <li>
            <a class="btn btn-outline-light" href="#">Producto</a>
        </li>
        <li>
            <a class="btn btn-outline-light" href="Controlador?menu=Empleado&accion=listar">Empleado</a>
        </li>
        <li>
            <a class="btn btn-outline-light" href="#">Clientes</a>
        </li>
        <li>
            <a class="btn btn-outline-light" href="#">Registrar venta</a>
        </li>
    </ul>
    <div class="dropdown">
        <button class="btn btn-outline-light dropdown-toggle" type="button" id="dropdownMenuButton2"
                data-bs-toggle="dropdown" aria-expanded="false">
            Dropdown button
        </button>
        <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton2">
            <li><a class="dropdown-item" href="#">
                ${usuario.getNombreEmpleado()}
            </a></li>
            <li><a class="dropdown-item" href="#">
                ${usuario.getUsuario()}
            </a>
            </li>
            <li><a class="dropdown-item" href="#">
                Salir
            </a></li>
            <li>
                <hr class="dropdown-divider">
            </li>
            <li><a class="dropdown-item" href="#">Salir 2</a></li>
        </ul>
    </div>
</nav>
<div class="d-flex flex-column flex-xl-row gap-3 p-5">
    <form action="" class="col-12 col-xl-4 border border-dark p-3 rounded d-flex flex-column">
        <label class="required-label">codigoEmpleado</label>
        <input type="text" class="form-control flex-grow-1">
        <label class="required-label">DPIEmpleado</label>
        <input type="text" class="form-control flex-grow-1">
        <label class="required-label">nombresEmpleado</label>
        <input type="text" class="form-control flex-grow-1">
        <label class="required-label">telefonoEmpleado</label>
        <input type="text" class="form-control flex-grow-1">
        <label class="required-label">estado</label>
        <input type="text" class="form-control flex-grow-1">
        <label class="required-label">usuario</label>
        <input type="text" class="form-control flex-grow-1">
        <label class="required-label">acciones</label>
        <input type="text" class="form-control flex-grow-1">
        <div class="d-flex justify-content-between mt-3">
            <button class="btn btn-outline-primary">Actualizar</button>
            <button class="btn btn-primary">Guardar</button>
        </div>
    </form>
    <table class="table border" style="min-width: 920px">
        <theader>
            <th>codigoEmpleado</th>
            <th>DPIEmpleado</th>
            <th>nombresEmpleado</th>
            <th>telefonoEmpleado</th>
            <th>estado</th>
            <th>usuario</th>
            <th>acciones</th>
        </theader>
        <tbody>
        <c:forEach var="empleado" items="${empleados}">
            <tr>
                <td>${empleado.getCodigoEmpleado()}</td>
                <td>${empleado.getDPIEmpleado()}</td>
                <td>${empleado.getNombreEmpleado()}</td>
                <td>${empleado.getTelefonoEmpleado()}</td>
                <td>${empleado.getEstado()}</td>
                <td>${empleado.getUsuario()}</td>
                <td>
                    <button class="btn btn-warning">Edit</button>
                    <button class="btn btn-danger">Delete</button>
                </td>
            </tr>
        </c:forEach>
        </tbody>

        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
                integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
                crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
                integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
                crossorigin="anonymous"></script>

    </table>
</div>
</body>
</html>
