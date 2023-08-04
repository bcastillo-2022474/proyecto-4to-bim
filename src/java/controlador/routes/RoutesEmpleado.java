package controlador.routes;

import controlador.OnRequest;
import modelo.Empleado;
import modelo.EmpleadoDAO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

public class RoutesEmpleado implements OnRequest {
    HashMap<String, OnAction> actions = new HashMap<String, OnAction>() {{
        put("listar", (req, res) -> {
            final EmpleadoDAO empleadoDao = new EmpleadoDAO();
            final List<Empleado> empleados = empleadoDao.listar();
            req.setAttribute("empleados", empleados);
            req.getRequestDispatcher("Empleado.jsp").forward(req, res);
        });

        put("agregar", (req, res) -> {

        });
    }};

    @Override
    public void run(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        final String accion = req.getParameter("accion");
        actions.entrySet().stream().forEach(e -> {
            if (accion.equals(e.getKey())) {
                try {
                    e.getValue().run(req, res);
                } catch (ServletException ex) {
                    throw new RuntimeException(ex);
                } catch (IOException ex) {
                    throw new RuntimeException(ex);
                }
            }
        });
    }

}

interface OnAction {
    void run(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException;
}
