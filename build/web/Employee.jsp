<jsp:useBean id="currentUser" scope="request" class="modelo.Employee"/>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<jsp:useBean id="selectedEmployee" scope="request" type="modelo.Employee"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="custom" tagdir="/WEB-INF/tags" %>

<%--
    Document   : Employee
    Created on : 20/07/2023, 01:52:50 PM
    Author     : informatica
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <custom:stylesheetsAndScripts/>
    <title>Employees</title>
</head>
<body class="vh-100">
<custom:navbar currentUser="${currentUser}"/>
<div class="h-100 p-3">
    <div class="d-flex">
        <div class="card col-sm-4">
            <div class="card-body">
                <form action="EmployeeController" onsubmit="return postEmployee()" method="POST">
                    <div class="form-group">
                        <label>Nombre</label>
                        <input type="text" value="${selectedEmployee.names}" name="txtName" class="form-control">
                    </div>
                    <div class="form-group">
                        <label>Usuario</label>
                        <input type="text" value="${selectedEmployee.username}" name="txtUsername" class="form-control">
                    </div>
                    <div class="form-group">
                        <label>DPI</label>
                        <input type="text" value="${selectedEmployee.DPI}" name="txtDPI" class="form-control">
                    </div>
                    <div class="form-group">
                        <label>Dirección</label>
                        <input type="text" value="${selectedEmployee.address}" name="txtAddress" class="form-control">
                    </div>
                    <div class="form-group">
                        <label>Telefono</label>
                        <input type="text" value="${selectedEmployee.phoneNumber}" name="txtPhoneNumber"
                               class="form-control">
                    </div>
                    <%--<div class="form-group">
                        <label>Foto</label>
                        <input type="text" value="${selectedEmployee.imgPath}" name="txtIMG" class="form-control">
                    </div>--%>
                    <input type="submit" class="btn btn-info" value="Agregar">
                    <button type="button" class="btn btn-success" onclick="editEmployee(${selectedEmployee.id})">
                        Actualizar
                    </button>
                </form>
            </div>
        </div>
        <div class="col-sm-8">
            <% final List<String> titles = new ArrayList<String>() {{
                add("ID");
                add("Nombre");
                add("Usuario");
                add("DPI");
                add("Direccion");
                add("Telefono");
                add("Acciones");
            }};%>
            <custom:table titles="<%= titles %>">
                <jsp:useBean id="employees" scope="request" type="java.util.List<modelo.Employee>"/>
                <c:forEach var="empleado" items="${employees}">
                    <tr>
                        <td>${empleado.id}</td>
                        <td>${empleado.names}</td>
                        <td>${empleado.username}</td>
                        <td>${empleado.DPI}</td>
                        <td>${empleado.address}</td>
                        <td>${empleado.phoneNumber}</td>
                            <%--<td>${empleado.state}</td>--%>
                        <td>
                            <a class="btn btn-warning" href="EmployeeController?id=${empleado.id}">Editar</a>
                            <button class="btn btn-danger" onclick="deleteEmployee(${empleado.id})">Eliminar</button>
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
            txtUsername: document.querySelector("input[name=txtUsername]").value,
            txtDPI: document.querySelector("input[name=txtDPI]").value,
            txtAddress: document.querySelector("input[name=txtAddress]").value,
            txtPhoneNumber: document.querySelector("input[name=txtPhoneNumber]").value,
        }
    }

    function postEmployee() {
        const params = getParams(-1);
        const isSomeValueEmpty = Object.entries(params).some(([_, value]) => !Boolean(value));
        if (isSomeValueEmpty) {
            alert("No puede haber campos vacios");
            return false
        }

        return true
    }

    function deleteEmployee(id) {
        if (!confirm("¿Está seguro de eliminar el empleado?")) return;

        fetch("EmployeeController?id=" + id, {
            method: "DELETE",
        }).then(() => {
            console.log("whuat")
            window.location.href = window.origin + "/proyecto-4to-bim/EmployeeController"
        })
    }

    function editEmployee(id) {
        // window.location.href = "EmployeeController";
        const params = getParams(id);

        const isSomeValueEmpty = Object.entries(params).some(([_, value]) => !Boolean(value));
        if (isSomeValueEmpty) {
            alert("No puede haber campos vacios");
            return;
        }

        const paramsString = Object.entries(params).reduce((acc, [key, value]) => acc + key + "=" + value + "&", "");

        fetch("EmployeeController?" + paramsString, {
            method: "PUT",
        })
            // navigate to EmployeeController again, like a refresh
            .then(() => {
                console.log("whuat")
                window.location.href = window.origin + "/proyecto-4to-bim/EmployeeController"
            })
    }
</script>
</body>
</html>