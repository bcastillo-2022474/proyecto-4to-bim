package controlador;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public interface ControllerChanger {
    void change(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException;

}
