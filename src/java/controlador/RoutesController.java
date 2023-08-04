package controlador;

import controlador.routes.RoutesEmpleado;
import modelo.Empleado;
import modelo.EmpleadoDAO;

import java.util.HashMap;
import java.util.List;

public class RoutesController {
    private static HashMap<String, OnRequest> pages = new HashMap<String, OnRequest>() {{
        put("Principal", (req, res) -> {
            req.getRequestDispatcher("Principal.jsp").forward(req, res);
        });
        put("Home", (req, res) -> {

        });
        put("Empleado", new RoutesEmpleado());
        put("Producto", (req, res) -> {

        });
        put("Cliente", (req, res) -> {

        });
        put("RegistrarVenta", (req, res) -> {

        });
    }};

    public static HashMap<String, OnRequest> getPages() {
        return pages;
    }
}
