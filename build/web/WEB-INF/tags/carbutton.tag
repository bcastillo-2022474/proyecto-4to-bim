<%@ tag import="java.util.ArrayList" %>
<%@ tag import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="custom" tagdir="/WEB-INF/tags" %>
<%@ tag description="My Custom Component" pageEncoding="UTF-8" %>
<div id="car-button" class="position-relative">
    <div id="car-dropdown" class="position-absolute bottom hidden flex-column">
        <%
            List<String> list = new ArrayList<String>() {{
               add("some");
               add("test");
               add("value");
            }};
        %>
        <custom:select list="<%= list %>"/>

        <button class="btn btn-primary">
            Agregar Productos
        </button>
    </div>
</div>

<script defer>
    const car = document.getElementById("car-button");
    const carDropdown = document.getElementById("car-dropdown")
    car.addEventListener("click", (e) => {
        carDropdown.classList.add("d-flex")
    })

</script>
