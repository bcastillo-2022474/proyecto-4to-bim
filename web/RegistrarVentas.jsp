<%@page import="java.util.List" %>
<%@page import="modelo.Product" %>
<jsp:useBean id="product" scope="request" class="modelo.Product"/>
<jsp:useBean id="client" scope="request" class="modelo.Client"/>
<jsp:useBean id="currentUser" scope="request" class="modelo.Employee"/>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="modelo.Employee" %>
<%@ page import="dao.Dao" %>
<%@ page import="dao.entitiesHandlers.EmployeeDaoHandler" %>
<%@ page import="java.util.stream.Collectors" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>
<html>
<head>
    <custom:stylesheetsAndScripts/>
</head>
<body class="hv-100">
<custom:navbar currentUser="${currentUser}"/>
<div class="d-flex">
    <div class="col-sm-4">
        <div class="card card-body d-flex flex-column gap-2">
            <div class="form-group">
                <label>Datos del Cliente:</label>
            </div>
            <div class="col-sm-6 d-flex">
                <jsp:useBean id="namesList" scope="request"
                             type="java.util.HashMap<java.lang.Integer, java.lang.String>"/>
                <custom:select dataId="${client != null ? client.id : -1}" inputValue="${client.names}"
                               inputId="namesList" className="form-control" list="${namesList}"/>
            </div>
            <div class="form-group">
                <label>Datos Productos</label>
            </div>
            <div class="d-flex col-sm-6">
                <jsp:useBean id="productsList" scope="request"
                             type="java.util.HashMap<java.lang.Integer, java.lang.String>"/>
                <custom:select dataId="${product != null ? product.id : -1}" inputValue="${product.productName}"
                               inputId="productsList" className="form-control" list="${productsList}"/>
            </div>
            <form class="d-flex flex-column gap-2" action="Controlador?menu=RegistrarVenta" method="POST">
                <!-- FORMULARIO PRODUCTO-->
                <div class="form-group">
                    <label>Producto</label>
                </div>
                <div class="form-group d-flex flex-column gap-2">
                    <div class="d-flex gap-2">
                        <div class="d-flex col-6">
                            <input type="text" name="txtPrecio" value="${product.price}" class="form-control"
                                   placeholder="Q. 00.00">
                        </div>
                        <div class="col-6">
                            <input type="text" name="txtStock" value="${product.stock}" class="form-control"
                                   placeholder="Stock">
                        </div>
                    </div>
                    <div class="col-12">
                        <input type="text" name="txtCantidad" value="1" class="form-control">
                    </div>
                </div>
                <!-- AGREGAR REGUISTRO-->
                <div class="form-group">
                    <div>
                        <button type="submit" name="accion" value="Agregar" class="btn btn-outline-info">Agregar
                            Producto
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div class="col-sm-7">
        <div class="card">
            <div class="card-body">
                <div class="d-flex col-sm-6 ml-auto">
                    <label>Serie No.</label>
                    <input type="text" name="txtNumSerie" value="" class="form-control">
                </div>
                <%
                    List<String> titles = new ArrayList<String>() {{
                        add("NUMERO");
                        add("CODIGO");
                        add("DESCRIPCION");
                        add("PRECIO");
                        add("CANTIDAD");
                        add("SUB-TOTAL");
                        add("ACCIONES");
                    }};
                %>
                <custom:table titles="<%= titles %>">
                    <c:forEach var="list" items="${lista}">
                        <tr>
                            <td>${list.getItem()}</td>
                            <td>${list.getCodigoProducto()}</td>
                            <td>${list.getDescripcionProd()}</td>
                            <td>${list.getPrecio()}</td>
                            <td>${list.getCantidad()}</td>
                            <td>${list.getSubTotal()}</td>
                            <td class="d-flex">
                                <a href="#" class="btn btn-warning" onclick="getVenta()">Editar</a>
                                <a href="#" class="btn btn-danger" style="margin-left: 10px">Eliminar</a>
                            </td>
                        </tr>
                    </c:forEach>
                </custom:table>
            </div>
            <div class="card-footer d-flex">
                <div class="col-sm-6">
                    <input type="submit" name="accion" value="Generar Venta" class="btn btn-success">
                    <input type="submit" name="accion" value="Cancelar" class="btn btn-danger">
                </div>
                <div class="col-sm-4 ml-auto">
                    <input type="text" name="txtTotal" value="Q. ${totalPagar}" class="form-control">
                </div>
            </div>

        </div>
    </div>

</div>

<script defer>
    document.addEventListener("custom-select-change", e => {
        const namesList = document.querySelector("#namesList");
        const productsList = document.querySelector("#productsList");

        if (!namesList.value || !productsList.value) return

        console.log(namesList.dataset.id)
        console.log(productsList.dataset.id)
        if (namesList.dataset.id !== -1 && productsList.dataset.id !== -1) {
            window.location.href = `Controlador?menu=RegistrarVenta&accion=BuscarClienteProducto&txtIdClient=` + namesList.dataset.id + "&txtCodigoProducto=" + productsList.dataset.id;
            return;
        }

        if (namesList.dataset.id !== -1) {
            window.location.href = `Controlador?menu=RegistrarVenta&accion=BuscarCliente&txtIdClient=` + namesList.dataset.id;
        }

        if (productsList.dataset.id !== -1) {
            window.location.href = `Controlador?menu=RegistrarVenta&accion=BuscarProducto&txtCodigoProducto=` + productsList.dataset.id;
        }
    })
</script>
</body>
</html>