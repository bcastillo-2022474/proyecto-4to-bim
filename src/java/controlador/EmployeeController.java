package controlador;

import dao.entities.EmployeeDao;
import modelo.Employee;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class EmployeeController extends HttpServlet {
    final EmployeeDao dao = new EmployeeDao();

    private void listAll(HttpServletRequest req, HttpServletResponse resp) {
        System.out.println(req.getAttribute("selectedEmployee"));
        try {
            req.setAttribute("employees", dao.getAll());
            Constants.controllerHandlers.get(Constants.screensEnum.EMPLOYEE).change(req, resp);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // super.doGet(req, resp);
        System.out.println("doGet");
        String id = req.getParameter("id");
        System.out.println(id);
        req.setAttribute("selectedEmployee", new Employee());
        if (id != null) {
            try {
                Employee employee = dao.get(Integer.parseInt(id));
                System.out.println("employee");
                System.out.println(employee.getNames());
                System.out.println(employee.getUsername());
                System.out.println(employee.getImgPath());
                req.setAttribute("selectedEmployee", employee);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }

        listAll(req, resp);
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // super.doDelete(req, resp);
        String id = req.getParameter("id");
        if (id != null) {
            try {
                dao.delete(Integer.parseInt(id));
                resp.setStatus(200);
                resp.getWriter().println("Deleted");
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // super.doPut(req, resp);
        String id = req.getParameter("id");
        String txtName = req.getParameter("txtName");
        String txtUsername = req.getParameter("txtUsername");
        String txtDPI = req.getParameter("txtDPI");
        String txtAddress = req.getParameter("txtAddress");
        String txtPhoneNumber = req.getParameter("txtPhoneNumber");

        try {
            Employee employee = new Employee(
                    Integer.parseInt(id),
                    txtDPI,
                    txtPhoneNumber,
                    txtName,
                    txtAddress,
                    txtUsername,
                    ""
            );
            dao.update(employee);
            resp.setStatus(200);
            resp.getWriter().println("Updated");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // super.doPost(req, resp);
        String txtName = req.getParameter("txtName");
        String txtUsername = req.getParameter("txtUsername");
        String txtDPI = req.getParameter("txtDPI");
        String txtAddress = req.getParameter("txtAddress");
        String txtPhoneNumber = req.getParameter("txtPhoneNumber");

        try {
            Employee employee = new Employee(
                    -1,
                    txtDPI,
                    txtPhoneNumber,
                    txtName,
                    txtAddress,
                    txtUsername,
                    ""
            );
            dao.save(employee);
            System.out.println(employee);
            req.setAttribute("selectedEmployee", new Employee());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        listAll(req, resp);
    }
}
