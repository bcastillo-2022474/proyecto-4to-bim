<%@ attribute name="currentUser" required="true" rtexprvalue="true" type="modelo.Employee" %>

<nav class="d-flex sticky-top justify-between align-items-center bg-danger p-3">
    <ul class="d-flex align-items-center mb-0 gap-3 list-unstyled flex-grow-1 ">
        <li>
            <a class="btn btn-outline-light" aria-current="page" href="${pageContext.request.contextPath}/Principal.jsp">Home
            </a>
        </li>
        <li>
            <a class="btn btn-outline-light" href="ProductController">Producto</a>
        </li>
        <li>
            <a class="btn btn-outline-light"
               href="EmployeeController">Empleado</a>
        </li>
        <li>
            <a class="btn btn-outline-light" href="ClientController">Clientes</a>
        </li>
        <li>
            <a class="btn btn-outline-light" href="#">Registrar venta</a>
        </li>
    </ul>
    <div class="dropdown">
        <button class="btn btn-outline-light dropdown-toggle" type="button" id="dropdownMenuButton2"
                data-bs-toggle="dropdown" aria-expanded="false">
            ${currentUser.names}
        </button>
        <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton2">
            <li><a class="dropdown-item d-flex align-items-center justify-content-center" href="#">
                <img style="width: 50px; height: 50px" class="rounded-circle border" src="${empty currentUser.imgPath ? "img/default-user.png" : currentUser.imgPath}" alt="">
            </a></li>
            <li><a class="dropdown-item" href="#">
                ${currentUser.names}
            </a></li>
            <li><a class="dropdown-item" href="#">
                ${currentUser.username}
            </a>
            <li><a class="dropdown-item" href="#">
                ${currentUser.username}@kinal.edu.gt
            </a>
            </li>
            <li>
                <hr class="dropdown-divider">
            </li>
            <li><a class="dropdown-item" href="LoginController?action=logout">Cerrar Sesión</a></li>
        </ul>
    </div>
</nav>