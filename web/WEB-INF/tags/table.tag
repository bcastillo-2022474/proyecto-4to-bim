<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="titles" required="true" rtexprvalue="true" type="java.util.List<java.lang.String>"
description="it represents the columns titles" %>
<%@ tag description="My Custom Component" pageEncoding="UTF-8" %>
<table class="table table-hober">
    <thead>
    <tr>
        <c:forEach var="title" items="${titles}">
            <td>${title}</td>
        </c:forEach>
    </tr>
    </thead>
    <tbody>
         <jsp:doBody/>
    </tbody>
</table>