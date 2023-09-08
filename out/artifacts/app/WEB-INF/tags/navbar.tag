<%@ tag import="java.util.ArrayList" %>
<%@ tag import="java.util.List" %>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>
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
        <%
            List<String> list = new ArrayList<String>() {{
               add("Apple iPhone 13 Pro Max");
            add("Samsung Galaxy S21 Ultra");
            add("Google Pixel 6 Pro");
            add("Sony PlayStation 5");
            add("Microsoft Xbox Series X");
            add("Dell XPS 13 Laptop");
            add("Lenovo ThinkPad X1 Carbon");
            add("Logitech MX Master 3 Mouse");
            add("Bose QuietComfort 45 Headphones");
            add("Canon EOS R5 Mirrorless Camera");
            add("Amazon Echo Show 10");
            add("Fitbit Versa 3 Smartwatch");
            add("Nintendo Switch OLED Model");
            add("LG OLED65CXPUA 4K TV");
            add("Razer BlackWidow V3 Pro Keyboard");
            add("Anker PowerCore 26800 Power Bank");
            add("GoPro HERO9 Black Action Camera");
            add("Sony WH-1000XM4 Wireless Headphones");
            add("Apple MacBook Pro 16-inch");
            add("Microsoft Surface Laptop 4");
            add("HP Spectre x360 13");
            add("Asus ROG Strix G15 Gaming Laptop");
            add("Samsung Odyssey G9 Gaming Monitor");
            add("Sony Alpha a7 III Mirrorless Camera");
            add("Bose SoundLink Revolve+ Bluetooth Speaker");
            add("Garmin Forerunner 945 GPS Watch");
            add("NVIDIA GeForce RTX 3080 Graphics Card");
            add("Apple iPad Pro 12.9-inch");
            add("Google Nest Hub Max");
            add("Sonos Beam Soundbar");
            }};
        %>
        <custom:select list="<%= list %>"/>
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
                    </form></li>
            </ul>
        </div>
    </div>
</nav>