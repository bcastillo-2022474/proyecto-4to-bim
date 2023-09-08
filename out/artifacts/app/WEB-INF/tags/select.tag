<%@ attribute name="list" required="true" rtexprvalue="true" type="java.util.List<java.lang.String>"
              description="it represents the columns titles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="position-relative custom-select-container">
    <input class="custom-select" placeholder="Ingresa una opción" aria-label="Select an option" type="text">
    <div class="position-absolute bottom flex-column w-100 custom-select-item-container d-none">
        <c:forEach var="item" items="${list}">
            <div class="custom-select-item px-2 py-1 border bg-white hover-bg-gray cursor-pointer">
                    ${item}
            </div>
        </c:forEach>
    </div>
</div>