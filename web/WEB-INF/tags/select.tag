<%@ attribute name="inputId" required="false" rtexprvalue="true" type="java.lang.String"
              description="it represents the id of the input" %>
<%@ attribute name="disabled" required="false" rtexprvalue="true" type="java.lang.String"
              description="it represents the id of the input" %>
<%@ attribute name="inputValue" required="false" rtexprvalue="true" type="java.lang.String"
              description="it represents the value of the input" %>
<%@ attribute name="dataId" required="false" rtexprvalue="true" type="java.lang.Integer"
              description="it represents the value of the data-id on the input" %>
<%@ attribute name="list" required="true" rtexprvalue="true"
              type="java.util.HashMap<java.lang.Integer, java.lang.String>"
              description="it represents the columns titles" %>
<%@ attribute name="className" required="false" rtexprvalue="true" type="java.lang.String"
              description="it represents the columns titles" %>
<%@ attribute name="itemClassName" required="false" rtexprvalue="true" type="java.lang.String"
              description="it represents the columns titles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="position-relative custom-select-container">
    <c:if test="${disabled == 'true'}">
        <input disabled value="${inputValue}" data-id="${dataId}" id="${inputId}" class="${className} custom-select"
            placeholder="Ingresa una opción" aria-label="Select an option" type="text">
    </c:if>
     <c:if test="${disabled == null || disabled != 'true'}">
        <input value="${inputValue}" data-id="${dataId}" id="${inputId}" class="${className} custom-select"
            placeholder="Ingresa una opción" aria-label="Select an option" type="text">
    </c:if>

    <div class="position-absolute bottom flex-column w-100 custom-select-item-container d-none">
        <c:forEach var="item" items="${list}">
            <div data-id="${item.key}" style="z-index: 100"
                 class="${itemClassName} custom-select-item px-2 py-1 border bg-white hover-bg-gray cursor-pointer">
                    ${item.value}
            </div>
        </c:forEach>
    </div>
</div>