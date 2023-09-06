package controlador;

import dao.Dao;
import dao.entitiesHandlers.ProductDaoHandler;
import modelo.Employee;
import modelo.Product;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ProductController extends HttpServlet {
    final Dao<Product> dao = new Dao<Product>(new ProductDaoHandler());

    private void listAll(HttpServletRequest req, HttpServletResponse resp) {
        System.out.println(req.getAttribute("selectedProduct"));
        try {
//            dao.getAll().forEach(System.out::println);
            req.setAttribute("products", dao.getAll());
            req.getRequestDispatcher("Producto.jsp").forward(req, resp);
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
        req.setAttribute("selectedProduct", new Product());
        if (id != null) {
            try {
                Product product = dao.get(Integer.parseInt(id));
                System.out.println("product");
                System.out.println(product.getProductName());
                System.out.println(product.getPrice());
                System.out.println(product.getStock());
                req.setAttribute("selectedProduct", product);
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
        String name = req.getParameter("txtName");
        String price = req.getParameter("txtPrice");
        String stock = req.getParameter("txtStock");
        System.out.println("doPut");
        System.out.println("id "+ id);
        System.out.println("name "+ name);
        System.out.println("price "+ price);
        System.out.println("stock "+ stock);

        if (id == null || name == null || price == null || stock == null) {
            System.out.println("doPut invalid");
            resp.setStatus(400);
            listAll(req, resp);
            return;
        }

        System.out.println("doPut valid");
        try {
            Product product = new Product(
                    Integer.parseInt(id),
                    name,
                    Double.parseDouble(price),
                    Integer.parseInt(stock)
            );
            dao.update(product);
            resp.setStatus(200);
            resp.getWriter().println("Updated");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // super.doPost(req, resp);
        String name = req.getParameter("txtName");
        String price = req.getParameter("txtPrice");
        String stock = req.getParameter("txtStock");
        System.out.println(name);

        if (name == null || price == null || stock == null) {
            resp.setStatus(400);
            listAll(req, resp);
            return;
        }

        try {
            Product product = new Product(
                    -1,
                    name,
                    Double.parseDouble(price),
                    Integer.parseInt(stock)
            );
            dao.save(product);
            System.out.println(product);
            req.setAttribute("selectedProduct", new Product());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        listAll(req, resp);
    }
}
