package controlador;

import config.DBConnection;
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
import java.util.List;

import static controlador.Constants.controllerHandlers;
import static controlador.Constants.screensEnum;

public class Controlador extends HttpServlet {


    int item = 0;
    Double precio, subTotal, totalPagar;
    List<Venta> lista = new ArrayList<>();
    Product product = new Product();
    Client client = new Client();
    protected final Connection dbConnection = new DBConnection().getConnection();


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // super.doGet(req, resp);
        /*final String URL = req.getRequestURI();
        System.out.println("URL: " + URL);
        String menu = req.getParameter("menu");

        // change to respective controller, so they can handle the request
        controllerHandlers.get(screensEnum.valueOf(menu.toUpperCase())).change(req, resp);*/

        doPost(req, resp);
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
        final Dao<Product> productDao = new Dao<Product>(new ProductDaoHandler());
        final Dao<Client> clientDao = new Dao<Client>(new ClientDaoHandler());

        if (!menu.equals("RegistrarVenta")) return;

        switch (accion) {
            case "BuscarCliente":
                System.out.println("txtIdClient: " + req.getParameter("txtIdClient"));
                int id = Integer.parseInt(req.getParameter("txtIdClient"));

                try {
                    client = clientDao.get(id);
                    req.setAttribute("client", client);
                } catch (Exception e) {
                    throw new RuntimeException(e);
                }
                break;
            case "BuscarProducto":
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
                //                    req.getRequestDispatcher("Controlador?menu=RegistrarVenta&accion=BuscarProducto").forward(req, resp);
                break;
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
}


