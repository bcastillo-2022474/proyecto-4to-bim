<jsp:useBean id="product" scope="request" class="modelo.Product"/>
<jsp:useBean id="client" scope="request" class="modelo.Client"/>
<jsp:useBean id="currentUser" scope="request" class="modelo.Employee"/>
<%@ page import="java.util.List" %>
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
        <div class="card card-body">
            <div class="form-group">
                <label>Datos del Cliente:</label>
            </div>
            <div class="col-sm-6 d-flex">
                <%--<input type="text" name="txtIdClient" value="${client.id}"
                       class="form-control" placeholder="Codigo">--%>
                <%
                    Dao<Employee> dao = new Dao<Employee>(new EmployeeDaoHandler());
                    List<String> namesList = new ArrayList<String>();
                    try {
                        namesList = dao.getAll().stream()
                                .map(Employee::getNames) // Assuming getNames() returns a String
                                .collect(Collectors.toList());
                    } catch (Exception e) {
                        throw new RuntimeException(e);
                    }
                %>
                <custom:select list="<%=namesList%>"/>
                <%--<button type="submit" name="accion" value="BuscarCliente" class="btn btn-outline-info">
                    Enviar consulta
                </button>--%>
            </div>
            <form action="Controlador?menu=RegistrarVenta" method="POST">
                <!-- FORMULARIO PRODUCTO-->
                <div class="form-group">
                    <label>Datos Productos</label>
                </div>
                <div class="form-group d-flex">
                    <div class="col-sm-6 d-flex">
                        <input type="text" name="txtCodigoProducto" value="${product.id}"
                               class="form-control" placeholder="Producto">
                        <button type="submit" name="accion" value="BuscarProducto" class="btn btn-outline-info">
                            Buscar
                        </button>
                    </div>
                    <div class="col-sm-6">
                        <input type="text" name="txtNombreProducto" value="${product.productName}"
                               class="form-control" placeholder="Producto">
                    </div>
                </div>

                <div class="form-group d-flex">
                    <div class="col-sm-6 d-flex">
                        <input type="text" name="txtPrecio" value="${product.price}" class="form-control"
                               placeholder="Q. 00.00">
                    </div>
                    <div class="col-sm-3">
                        <input type="text" name="txtCantidad" value="1" class="form-control">
                    </div>
                    <div class="col-sm-3">
                        <input type="text" name="txtStock" value="${product.stock}" class="form-control"
                               placeholder="Stock">
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
</body>
</html>