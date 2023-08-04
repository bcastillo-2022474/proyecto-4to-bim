<%-- 
    Document   : principal
    Created on : 14/07/2023, 05:22:13 PM
    Author     : informatica
    --%>

    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

        <title>Menu Principal</title>
    </head>
    <body>
        <nav class="d-flex justify-between align-items-center bg-danger p-3">
            <ul class="d-flex align-items-center mb-0 gap-3 list-unstyled flex-grow-1 ">
                <li>
                    <a class="btn btn-outline-light" aria-current="page" href="Controlador?menu=Home">Home
                    </a>
                </li>
                <li >
                    <a class="btn btn-outline-light" href="#">Producto</a>
                </li>
                <li>
                    <a class="btn btn-outline-light" href="Controlador?menu=Empleado&accion=listar">Empleado</a>
                </li>
                <li >
                    <a class="btn btn-outline-light" href="#">Clientes</a>
                </li>
                <li >
                    <a class="btn btn-outline-light" href="#">Registrar venta</a>
                </li>
            </ul>
            <div class="dropdown">
              <button class="btn btn-outline-light dropdown-toggle" type="button" id="dropdownMenuButton2" data-bs-toggle="dropdown" aria-expanded="false">
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
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Salir 2</a></li>
        </ul>
    </div>
</nav>
<div class="p-3">

</div>


<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</body>
</html>
