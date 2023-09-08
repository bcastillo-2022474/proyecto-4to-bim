<%@ tag import="java.util.ArrayList" %>
<%@ tag import="java.util.List" %>
<%@ tag import="java.util.HashMap" %>
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
            HashMap<Integer, String> list = new HashMap<Integer, String>() {{
                put(1, "Apple iPhone 13 Pro Max");
                put(2, "Samsung Galaxy S21 Ultra");
                put(3, "Google Pixel 6 Pro");
                put(4, "Sony PlayStation 5");
                put(5, "Microsoft Xbox Series X");
                put(6, "Dell XPS 13 Laptop");
                put(7, "Lenovo ThinkPad X1 Carbon");
                put(8, "Logitech MX Master 3 Mouse");
                put(9, "Bose QuietComfort 45 Headphones");
                put(10, "Canon EOS R5 Mirrorless Camera");
                put(11, "Amazon Echo Show 10");
                put(12, "Fitbit Versa 3 Smartwatch");
                put(13, "Nintendo Switch OLED Model");
                put(14, "LG OLED65CXPUA 4K TV");
                put(15, "Razer BlackWidow V3 Pro Keyboard");
                put(16, "Anker PowerCore 26800 Power Bank");
                put(17, "GoPro HERO9 Black Action Camera");
                put(18, "Sony WH-1000XM4 Wireless Headphones");
                put(19, "Apple MacBook Pro 16-inch");
                put(20, "Microsoft Surface Laptop 4");
                put(21, "HP Spectre x360 13");
                put(22, "Asus ROG Strix G15 Gaming Laptop");
                put(23, "Samsung Odyssey G9 Gaming Monitor");
                put(24, "Sony Alpha a7 III Mirrorless Camera");
                put(25, "Bose SoundLink Revolve+ Bluetooth Speaker");
                put(26, "Garmin Forerunner 945 GPS Watch");
                put(27, "NVIDIA GeForce RTX 3080 Graphics Card");
                put(28, "Apple iPad Pro 12.9-inch");
                put(29, "Google Nest Hub Max");
                put(30, "Sonos Beam Soundbar");
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
                    </form>
                </li>
            </ul>
        </div>
    </div>
</nav>