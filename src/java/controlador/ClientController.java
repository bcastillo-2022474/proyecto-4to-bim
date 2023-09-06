package controlador;

import dao.Dao;
import dao.entitiesHandlers.ClientDaoHandler;
import modelo.Client;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ClientController extends HttpServlet {
     final Dao<Client> dao = new Dao<Client>(new ClientDaoHandler());

    private void listAll(HttpServletRequest req, HttpServletResponse resp) {
        System.out.println(req.getAttribute("selectedClient"));
        try {
            req.setAttribute("clients", dao.getAll());
            Constants.controllerHandlers.get(Constants.screensEnum.CLIENT).change(req, resp);
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
        req.setAttribute("selectedClient", new Client());
        if (id != null) {
            try {
                Client employee = dao.get(Integer.parseInt(id));
                System.out.println("employee");
                System.out.println(employee.getNames());
                System.out.println(employee.getDPI());
                System.out.println(employee.getAddress());
                req.setAttribute("selectedClient", employee);
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
        String txtDPI = req.getParameter("txtDPI");
        String txtAddress = req.getParameter("txtAddress");

        try {
            Client employee = new Client(
                    Integer.parseInt(id),
                    txtDPI,
                    txtName,
                    txtAddress
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
        String txtDPI = req.getParameter("txtDPI");
        String txtAddress = req.getParameter("txtAddress");

        try {
            Client employee = new Client(
                    -1,
                    txtDPI,
                    txtName,
                    txtAddress
            );
            dao.save(employee);
            System.out.println(employee);
            req.setAttribute("selectedClient", new Client());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        listAll(req, resp);
    }
}
