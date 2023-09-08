<jsp:useBean id="productsSelected" scope="request"
             type="java.util.HashMap<java.lang.Integer, config.Tuple<java.lang.Integer, java.lang.String>>"/>
<%@ tag import="java.util.ArrayList" %>
<%@ tag import="java.util.List" %>
<%@ tag import="java.util.HashMap" %>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="currentUser" required="true" rtexprvalue="true" type="modelo.Employee" %>

<nav class="d-flex sticky-top justify-between align-items-center bg-danger p-3">
    <ul class="d-flex align-items-center mb-0 gap-3 list-unstyled flex-grow-1 ">
        <li>
            <a class="btn btn-outline-light" aria-current="page"
               href="${pageContext.request.contextPath}/Principal.jsp">Home
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
            <a class="btn btn-outline-light" href="Controlador?menu=RegistrarVenta&accion=default">Registrar venta</a>
        </li>
    </ul>
    <div class="d-flex gap-3">
        <div class="position-relative">
            <h1><a href="Controlador?menu=cart">
                <i class="fa-solid fa-cart-shopping cursor-pointer"></i>
            </a></h1>
            <c:if test="${productsSelected.size() > 0 || productsSelected != null}">
                <div style="top: 0; right: 5px" class="position-absolute bg-danger rounded-full">${productsSelected.size()}</div>
            </c:if>
        </div>
        <div class="dropdown">
            <button class="btn btn-outline-light dropdown-toggle" type="button" id="dropdownMenuButton2"
                    data-bs-toggle="dropdown" aria-expanded="false">
                ${currentUser.names}
            </button>
            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton2">
                <li><a class="dropdown-item d-flex align-items-center justify-content-center" href="#">
                    <img style="width: 50px; height: 50px" class="rounded-circle border"
                         src="${empty currentUser.imgPath ? "img/default-user.png" : currentUser.imgPath}" alt="">
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
                <li>
                    <form action="LoginController" method="post">
                        <button type="submit" class="dropdown-item" name="action" value="logout">Cerrar Sesión</button>
                    </form>
                </li>
            </ul>
        </div>
    </div>
</nav>