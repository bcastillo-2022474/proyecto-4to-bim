<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="currentUser" scope="request" class="modelo.Employee"/>
<%-- 
    Document   : carrito
    Created on : 8/09/2023, 01:41:52 PM
    Author     : informatica
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <custom:stylesheetsAndScripts/>
    <title>JSP Page</title>
</head>
<body class="vh-100">
<custom:navbar currentUser="${currentUser}"/>
<div
     class="p-5 pb-1 d-flex flex-column pt-5 gap-3">
    <div style="max-height: 70vh;" class="h-100 d-flex flex-column gap-3 flex-wrap align-items-center">
        <jsp:useBean id="productsSelected" scope="request"
                     type="java.util.HashMap<java.lang.Integer, config.Tuple<java.lang.Integer, java.lang.String>>"/>
        <c:forEach var="product" items="${productsSelected}">
            <jsp:useBean id="productsList" scope="request"
                         type="java.util.HashMap<java.lang.Integer, java.lang.String>"/>
            <div style="width: fit-content;" class="d-flex flex-column gap-2 input-container-parent p-3 border">
                <div class="d-flex gap-2">
                    <label>Cantidad</label>
                    <input type="text" class="input-quantity"
                           value="${product.value.key != null ? product.value.key : 1}">
                </div>
                <div class="d-flex gap-2">
                    <label>Producto</label>
                    <custom:select disabled="true" dataId="${product.key}" inputValue="${product.value.value}" list="${productsList}"/>
                </div>
                <button class="btn btn-danger">Eliminar</button>
            </div>
        </c:forEach>
        <div style="width: fit-content;" class="d-flex flex-column gap-2 input-container-parent p-3 border">
            <div class="d-flex gap-2">
                <label>Cantidad</label>
                <input id="carrito-1-quantity" class="input-quantity" type="text" value="1">
            </div>
            <div class="d-flex gap-2">
                <label>Producto</label>
                <custom:select inputId="carrito-1" list="${productsList}"/>
            </div>
        </div>
    </div>
</div>
<form method="post" action="Controlador" class="d-flex justify-content-center align-items-center">
    <button type="submit" name="accion" value="save" class="btn btn-primary">Submit</button>
</form>
</body>
</html>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        document.querySelector("#carrito-1-quantity").focus();
    })

    document.addEventListener("custom-select-change", (e) => {
        const customSelect = e.target.closest(".custom-select")
        if (!customSelect.value) return;
        const inputQuantity = customSelect.closest(".input-container-parent").querySelector(".input-quantity");

        window.location.href = "Controlador?menu=cart&addProduct=" + customSelect.dataset.id + "&quantity=" + inputQuantity.value;
    })
</script>