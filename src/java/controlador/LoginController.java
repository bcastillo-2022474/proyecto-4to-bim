package controlador;

import dao.entities.EmployeeDao;
import modelo.Employee;
import state.State;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class LoginController extends HttpServlet {

    EmployeeDao employeeDao = new EmployeeDao();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        final String action = req.getParameter("action");


        if (action.equalsIgnoreCase("logout")) {
            State.currentUser = null;
            req.getRequestDispatcher("index.jsp").forward(req, resp);
            return;
        }
        // early return cause there is no other possible action
        if (!action.equalsIgnoreCase("login")) return;

        final String username = req.getParameter("txtUsername");
        final String password = req.getParameter("txtPassword");
        try {
            final Employee employee = employeeDao.login(username, password);
            State.currentUser = employee;
            req.setAttribute("currentUser", employee);
            req.getRequestDispatcher("Principal.jsp").forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        }

    }
}
