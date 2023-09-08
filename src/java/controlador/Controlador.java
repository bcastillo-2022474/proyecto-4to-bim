package controlador;

import config.DBConnection;
import config.Tuple;
import dao.Dao;
import dao.entitiesHandlers.ClientDaoHandler;
import dao.entitiesHandlers.ProductDaoHandler;
import modelo.Client;
import modelo.Product;
import modelo.Sale;
import modelo.Venta;
import state.State;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import static controlador.Constants.controllerHandlers;
import static controlador.Constants.screensEnum;

public class Controlador extends HttpServlet {


    int item = 0;
    Double precio, subTotal, totalPagar;
    List<Venta> lista = new ArrayList<>();
    Product product = new Product();
    Client client = new Client();
    final Dao<Product> productDao = new Dao<Product>(new ProductDaoHandler());
    final Dao<Client> clientDao = new Dao<Client>(new ClientDaoHandler());
    protected final Connection dbConnection = new DBConnection().getConnection();
    final HashMap<Integer, Tuple<Integer, String>> selectedProducts = new HashMap<Integer, Tuple<Integer, String>>();


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // super.doGet(req, resp);
        /*final String URL = req.getRequestURI();
        System.out.println("URL: " + URL);
        String menu = req.getParameter("menu");

        // change to respective controller, so they can handle the request
        controllerHandlers.get(screensEnum.valueOf(menu.toUpperCase())).change(req, resp);*/

        String menu = req.getParameter("menu");
        if (menu.equals("cart")) {
            doPut(req, resp);
            return;
        }

        doPost(req, resp);
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        super.doPut(req, resp); //To change body of generated methods, choose Tools | Templates.
        final String productId = req.getParameter("addProduct");
        final String quantity = req.getParameter("quantity");
        System.out.println(quantity);
        System.out.println(productId);
        if (productId != null && !productId.equals("-1")) {
            try {
                Product product1 = productDao.get(Integer.parseInt(productId));
                selectedProducts.put(product1.getId(), new Tuple<Integer, String>(Integer.parseInt(quantity), product1.getProductName()));
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }

        try {
            HashMap<Integer, String> productsList = new HashMap<Integer, String>();
            for (Product product : productDao.getAll()) {
                if (selectedProducts.get(product.getId()) != null) continue;
                productsList.put(product.getId(), product.getProductName());
            }
            req.setAttribute("productsList", productsList);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        req.setAttribute("productsSelected", selectedProducts);
        req.getRequestDispatcher("carrito.jsp").forward(req, resp);

    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // super.doPost(req, resp);
        /*
        txtIdClient
        txtNameClient
        txtCodigoProducto
        txtNombreProducto
        txtPrecio
        txtCantidad
        txtStock
        txtNumSerie
        txtTotal
        * */
        String menu = req.getParameter("menu");
        String accion = req.getParameter("accion");
        System.out.println(accion);
        if (accion.equals("save")) {
            handlePostCar(req, resp);
            return;
        }

        if (!menu.equals("RegistrarVenta")) return;
        try {
            final HashMap<Integer, String> namesList = new HashMap<Integer, String>();
            for (Client client : clientDao.getAll()) {
                namesList.put(client.getId(), client.getNames());
            }
            req.setAttribute("namesList", namesList);

            final HashMap<Integer, String> productsList = new HashMap<Integer, String>();
            for (Product product : productDao.getAll()) {
                productsList.put(product.getId(), product.getProductName());
            }
            req.setAttribute("productsList", productsList);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        if ("BuscarCliente".equals(accion) || "BuscarClienteProducto".equals(accion)) {
            System.out.println("txtIdClient: " + req.getParameter("txtIdClient"));
            int id = Integer.parseInt(req.getParameter("txtIdClient"));

            try {
                client = clientDao.get(id);
                req.setAttribute("client", client);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }
        if ("BuscarProducto".equals(accion) || "BuscarClienteProducto".equals(accion)) {
            int codProduc = Integer.parseInt(req.getParameter("txtCodigoProducto"));

            try {
                product = productDao.get(codProduc);
                req.setAttribute("product", product);
                req.setAttribute("lista", lista);
                req.setAttribute("totalPagar", totalPagar);
                req.setAttribute("client", client);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }


        switch (accion) {
            case "Agregar":
                req.setAttribute("client", client);
                double totalPagar = 0.0;
                item = item + 1;
                final int codPro = product.getId();
                final String descripcion = req.getParameter("txtNombreProducto");
                final double precio = Double.parseDouble(req.getParameter("txtPrecio"));
                final int cantid = Integer.parseInt(req.getParameter("txtCantidad"));
                final double subTotal = precio * cantid;
                final Venta venta = new Venta();
                venta.setItem(item);
                venta.setCodigoProducto(codPro);
                venta.setDescripcionProd(descripcion);
                venta.setPrecio(precio);
                venta.setCantidad(cantid);
                venta.setSubTotal(subTotal);
                lista.add(venta);
                for (int i = 0; i < lista.size(); i++) {
                    totalPagar = totalPagar + lista.get(i).getSubTotal();

                }
                req.setAttribute("totalPagar", totalPagar);
                req.setAttribute("lista", lista);
                break;
            case "Generar Venta":
                try {
                    PreparedStatement ps = dbConnection.prepareStatement("select * from CarSales where employee_id = ?");
                    ps.setInt(1, State.currentUser.getId());
                    ResultSet resultSet = ps.executeQuery();

                    while (resultSet.next()) {
                        int quantity = resultSet.getInt("quantity");
                        int employee_id = resultSet.getInt("employee_id");
                        // check if something
                    }

                    PreparedStatement preparedStatement = dbConnection.prepareStatement("insert into CarSales(employee_id, quantity) value (?,?)");
                    preparedStatement.setInt(1, (int) State.currentUser.getId());
                    preparedStatement.setInt(2, lista.size());

                    preparedStatement.executeUpdate();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
        }
        req.getRequestDispatcher("RegistrarVentas.jsp").forward(req, resp);
    }

    private void handlePostCar(HttpServletRequest req, HttpServletResponse resp) {
        State.selectedProducts = selectedProducts;
        System.out.println(selectedProducts);
        System.out.println("jsp");
        req.setAttribute("productsSelected", selectedProducts);
        try {
            req.getRequestDispatcher("carrito.jsp").forward(req, resp);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}


