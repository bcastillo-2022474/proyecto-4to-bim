<jsp:useBean id="currentUser" scope="request" class="modelo.Employee"/>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="modelo.Employee" %>
<%@ page import="state.State" %>
<jsp:useBean id="selectedProduct" scope="request" type="modelo.Product"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="custom" tagdir="/WEB-INF/tags" %>

<%--
    Document   : Producto
    Created on : 20/07/2023, 01:52:50 PM
    Author     : informatica
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <custom:stylesheetsAndScripts/>
    <title>Productos</title>
</head>
<body class="vh-100">
<custom:navbar currentUser="${currentUser}" />
<div class="h-100 p-3">
    <div class="d-flex">
    <div class="card col-sm-4">
        <div class="card-body">
            <form action="ProductController" method="POST">
                <div class="form-group">
                    <label>Nombre</label>
                    <input type="text" value="${selectedProduct.productName}" name="txtName" class="form-control">
                </div>
                <div class="form-group">
                    <label>Precio</label>
                    <input type="text" value="${selectedProduct.price}" name="txtPrice" class="form-control">
                </div>
                <div class="form-group">
                    <label>Stock</label>
                    <input type="text" value="${selectedProduct.stock}" name="txtStock" class="form-control">
                </div>
                <input type="submit" class="btn btn-info" value="Agregar">
                <button type="button" class="btn btn-success" onclick="editProduct(${selectedProduct.id})">Actualizar
                </button>
            </form>
        </div>
    </div>
    <div class="col-sm-8">
        <% final List<String> titles = new ArrayList<String>() {{
            add("ID");
            add("Nombre");
            add("Precio");
            add("Stock");
            add("Estado");
        }};%>
        <custom:table titles="<%= titles %>">
            <jsp:useBean id="products" scope="request" type="java.util.List<modelo.Product>"/>
            <c:forEach var="producto" items="${products}">
                <tr>
                    <td>${producto.id}</td>
                    <td>${producto.productName}</td>
                    <td>${producto.price}</td>
                    <td>${producto.stock}</td>
                        <%--<td>${producto.state}</td>--%>
                    <td>
                        <a class="btn btn-warning" href="ProductController?id=${producto.id}">Editar</a>
                        <button class="btn btn-danger" onclick="deleteProduct(${producto.id})">Eliminar</button>
                    </td>
                </tr>
            </c:forEach>
        </custom:table>
    </div>
</div>
</div>

<script>
    function deleteProduct(id) {
        if (!confirm("¿Está seguro de eliminar el producto?")) return;

        fetch("ProductController?id=" + id, {
            method: "DELETE",
        }).then(() => {
            console.log("whuat")
            window.location.href = window.origin + "/app/ProductController"
        })
    }

    function editProduct(id) {
        // window.location.href = "ProductController";
        const txtName = document.querySelector("input[name=txtName]").value;
        const txtPrice = document.querySelector("input[name=txtPrice]").value;
        const txtStock = document.querySelector("input[name=txtStock]").value;
        console.log({txtName, txtPrice, txtStock})
        fetch("ProductController?id=" + id + "&txtName=" + txtName + "&txtPrice=" + txtPrice + "&txtStock=" + txtStock, {
            method: "PUT",
        })
            // navigate to ProductController again, like a refresh
            .then(() => {
                console.log("whuat")
                window.location.href = window.origin + "/app/ProductController"
            })
    }
</script>
</body>
</html>