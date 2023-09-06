package controlador;

import java.util.HashMap;

public class Constants {
    static enum screensEnum {
        EMPLOYEE, CLIENT, PRODUCT, SALE, LOGIN
    }

    static HashMap<screensEnum, ControllerChanger> controllerHandlers = new HashMap<screensEnum, ControllerChanger>() {{
        put(screensEnum.EMPLOYEE, (req, resp) -> req.getRequestDispatcher("Employee.jsp").forward(req, resp));
        put(screensEnum.CLIENT, (req, resp) -> req.getRequestDispatcher("Client.jsp").forward(req, resp));
        put(screensEnum.PRODUCT, (req, resp) -> req.getRequestDispatcher("Product.jsp").forward(req, resp));
        put(screensEnum.SALE, (req, resp) -> req.getRequestDispatcher("Sale.jsp").forward(req, resp));
        put(screensEnum.LOGIN, ((req, resp) -> req.getRequestDispatcher("index.jsp").forward(req, resp)));
    }};
}
