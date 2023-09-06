package controlador;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static controlador.Constants.controllerHandlers;
import static controlador.Constants.screensEnum;

public class Controlador extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // super.doGet(req, resp);
        final String URL = req.getRequestURI();
        System.out.println("URL: " + URL);
        String menu = req.getParameter("menu");

        // change to respective controller, so they can handle the request
        controllerHandlers.get(screensEnum.valueOf(menu.toUpperCase())).change(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // super.doPost(req, resp);
    }
}


