<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>
<jsp:useBean id="currentUser" scope="request" type="modelo.Employee"/>
<%--
    Document   : principal
    Created on : 14/07/2023, 05:22:13 PM
    Author     : informatica
    --%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <custom:stylesheetsAndScripts/>
    <title>Menu Principal</title>
</head>
<body class="vh-100">
<custom:navbar currentUser="${currentUser}" />
<div class="p-3 h-100">
    save Info as db
</div>
</body>
</html>
