<jsp:useBean id="currentUser" scope="request" class="modelo.Employee"/>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<jsp:useBean id="selectedClient" scope="request" type="modelo.Client"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="custom" tagdir="/WEB-INF/tags" %>

<%--
    Document   : Client
    Created on : 20/07/2023, 01:52:50 PM
    Author     : informatica
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <custom:stylesheetsAndScripts/>
    <title>Clients</title>
</head>
<body class="vh-100">
<custom:navbar currentUser="${currentUser}"/>
<div class="h-100 p-3">
    <div class="d-flex">
        <div class="card col-sm-4">
            <div class="card-body">
                <form action="ClientController" onsubmit="return postClient()" method="POST">
                    <div class="form-group">
                        <label>Nombre</label>
                        <input type="text" value="${selectedClient.names}" name="txtName" class="form-control">
                    </div>
                    <div class="form-group">
                        <label>DPI</label>
                        <input type="text" value="${selectedClient.DPI}" name="txtDPI" class="form-control">
                    </div>
                    <div class="form-group">
                        <label>Dirección</label>
                        <input type="text" value="${selectedClient.address}" name="txtAddress" class="form-control">
                    </div>
                    <%--<div class="form-group">
                        <label>Foto</label>
                        <input type="text" value="${selectedClient.imgPath}" name="txtIMG" class="form-control">
                    </div>--%>
                    <input type="submit" class="btn btn-info" value="Agregar">
                    <button type="button" class="btn btn-success" onclick="editClient(${selectedClient.id})">
                        Actualizar
                    </button>
                </form>
            </div>
        </div>
        <div class="col-sm-8">
            <% final List<String> titles = new ArrayList<String>() {{
                add("ID");
                add("Nombre");
                add("DPI");
                add("Direccion");
                add("Acciones");
            }};%>
            <custom:table titles="<%= titles %>">
                <jsp:useBean id="clients" scope="request" type="java.util.List<modelo.Client>"/>
                <c:forEach var="cliente" items="${clients}">
                    <tr>
                        <td>${cliente.id}</td>
                        <td>${cliente.names}</td>
                        <td>${cliente.DPI}</td>
                        <td>${cliente.address}</td>
                            <%--<td>${cliente.state}</td>--%>
                        <td>
                            <a class="btn btn-warning" href="ClientController?id=${cliente.id}">Editar</a>
                            <button class="btn btn-danger" onclick="deleteClient(${cliente.id})">Eliminar</button>
                        </td>
                    </tr>
                </c:forEach>
            </custom:table>
        </div>
    </div>
</div>

<script>
    function getParams(id) {
        return {
            id,
            txtName: document.querySelector("input[name=txtName]").value,
            txtDPI: document.querySelector("input[name=txtDPI]").value,
            txtAddress: document.querySelector("input[name=txtAddress]").value,
        }
    }

    function postClient() {
        const params = getParams(-1);
        const isSomeValueEmpty = Object.entries(params).some(([_, value]) => !Boolean(value));
        if (isSomeValueEmpty) {
            alert("No puede haber campos vacios");
            return false
        }

        return true
    }

    function deleteClient(id) {
        if (!confirm("¿Está seguro de eliminar el cliente?")) return;

        fetch("ClientController?id=" + id, {
            method: "DELETE",
        }).then(() => {
            console.log("whuat")
            window.location.href = window.origin + "/app/ClientController"
        })
    }

    function editClient(id) {
        // window.location.href = "ClientController";
        const params = getParams(id);

        const isSomeValueEmpty = Object.entries(params).some(([_, value]) => !Boolean(value));
        if (isSomeValueEmpty) {
            alert("No puede haber campos vacios");
            return;
        }

        const paramsString = Object.entries(params).reduce((acc, [key, value]) => acc + key + "=" + value + "&", "");

        fetch("ClientController?" + paramsString, {
            method: "PUT",
        })
            // navigate to ClientController again, like a refresh
            .then(() => {
                console.log("whuat")
                window.location.href = window.origin + "/app/ClientController"
            })
    }
</script>
</body>
</html>