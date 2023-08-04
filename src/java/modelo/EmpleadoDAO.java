
package modelo;

import config.Conexion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class EmpleadoDAO {
    Conexion cn = new Conexion();

    // METODO PARA VALIIDAR
    public Empleado validar(String usuario, String DPIEmpleado) {
        //Instanciar un objeto de tipo empleado
        //Agregar una variable de tipo string para la consulta
        String sql = "select*from Empleado where usuario = ? and DPIEmpleado = ?";
        try {
            Connection connection = cn.Conexion();
            PreparedStatement ps = connection.prepareStatement(sql);

            ps.setString(1, usuario);
            ps.setString(2, DPIEmpleado);

            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()) {
                int codigoEmpleado = (resultSet.getInt("codigoEmpleado"));
                String nombresEmpleado = (resultSet.getString("nombresEmpleado"));
                String telefonoEmpleado = (resultSet.getString("telefonoEmpleado"));
                String estado = (resultSet.getString("estado"));
                return new Empleado(codigoEmpleado, DPIEmpleado, nombresEmpleado, telefonoEmpleado, estado, usuario);
            }
            return null;
        } catch (Exception e) {
            e.printStackTrace();
        }

        System.out.println("AAAAAAAAAAAAAAAAAAAAAAAA");
        return null;
    }

    public List<Empleado> listar() {
        final String SQL = "SELECT * FROM Empleado";
        try {
            final List<Empleado> empleados = new ArrayList<Empleado>();

            final Connection connection = cn.Conexion();
            final PreparedStatement ps = connection.prepareStatement(SQL);

            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()) {
                Integer codigoEmpleado = (resultSet.getInt("codigoEmpleado"));
                String DPIEmpleado = (resultSet.getString("DPIEmpleado"));
                String nombresEmpleado = (resultSet.getString("nombresEmpleado"));
                String usuario = (resultSet.getString("usuario"));
                String telefonoEmpleado = (resultSet.getString("telefonoEmpleado"));
                String estado = (resultSet.getString("estado"));

                final Empleado empleado = new Empleado(codigoEmpleado, DPIEmpleado, nombresEmpleado, telefonoEmpleado, estado, usuario);
                empleados.add(empleado);
            }
            return empleados;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public void agregar(Empleado empleado) {
        final String SQL = "INSERT INTO Empleado(DPIEmpleado, nombresEmpleado, telefonoEmpleado, estado, usuario) VALUES (?, ?, ?, ?, ?)";
        try {
            final Connection connection = cn.Conexion();
            final PreparedStatement ps = connection.prepareStatement(SQL);

            ps.setString(1, empleado.getDPIEmpleado());
            ps.setString(2, empleado.getNombresEmpleado());
            ps.setString(3, empleado.getTelefonoEmpleado());
            ps.setString(4, empleado.getEstado());
            ps.setString(5, empleado.getUsuario());

            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Empleado econtrarConCodigo() {
        final String SQL = "SELECT * FROM Empleado WHERE codigoEmpleado = ?";
        try {
            final Connection connection = cn.Conexion();
            final PreparedStatement ps = connection.prepareStatement(SQL);

            ps.setInt(1, 1);

            ResultSet resultSet = ps.executeQuery();
            while (resultSet.next()) {
                Integer codigoEmpleado = (resultSet.getInt("codigoEmpleado"));
                String DPIEmpleado = (resultSet.getString("DPIEmpleado"));
                String nombresEmpleado = (resultSet.getString("nombresEmpleado"));
                String usuario = (resultSet.getString("usuario"));
                String telefonoEmpleado = (resultSet.getString("telefonoEmpleado"));
                String estado = (resultSet.getString("estado"));

                final Empleado empleado = new Empleado(codigoEmpleado, DPIEmpleado, nombresEmpleado, telefonoEmpleado, estado, usuario);
                return empleado;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public void actualizar(int id) {
        final String SQL = "UPDATE Empleado SET DPIEmpleado = ?, nombresEmpleado = ?, telefonoEmpleado = ?, estado = ?, usuario = ? WHERE codigoEmpleado = ?";
        try {
            final Connection connection = cn.Conexion();
            final PreparedStatement ps = connection.prepareStatement(SQL);

            ps.setString(1, "DPIEmpleado");
            ps.setString(2, "nombresEmpleado");
            ps.setString(3, "telefonoEmpleado");
            ps.setString(4, "estado");
            ps.setString(5, "usuario");
            ps.setInt(6, id);

            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
