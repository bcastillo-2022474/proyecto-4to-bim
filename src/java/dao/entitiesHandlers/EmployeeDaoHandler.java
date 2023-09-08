package dao.entitiesHandlers;

import dao.EntityDaoHandler;
import modelo.Employee;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class EmployeeDaoHandler implements EntityDaoHandler<Employee> {
    @Override
    public String getAddQuery() {
        return "insert into Employee(DPI, names, phone_number, address, username, img_path) values (?, ?, ?, ?, ?, ?)";
    }

    @Override
    public String getUpdateQuery() {
        return "update Employee set DPI = ?, names = ?, phone_number = ?, address = ?, username = ?, img_path = ? where id = ?";
    }

    @Override
    public String getDeleteQuery() {
        return "delete from Employee where id = ?";
    }

    @Override
    public String getSearchQuery() {
        return "select * from Employee where id = ?";
    }

    @Override
    public String getListAllQuery() {
        return "select * from Employee";
    }

    @Override
    public void setSaveParameters(PreparedStatement preparedStatement, Employee employee) throws SQLException {
        preparedStatement.setString(1, employee.getDPI());
        preparedStatement.setString(2, employee.getNames());
        preparedStatement.setString(3, employee.getPhoneNumber());
        preparedStatement.setString(4, employee.getAddress());
        preparedStatement.setString(5, employee.getUsername());
        preparedStatement.setString(6, employee.getImgPath());
        preparedStatement.setString(7, employee.getSelfDescription());
    }

    @Override
    public void setUpdateParameters(PreparedStatement preparedStatement, Employee model) throws SQLException {
        setSaveParameters(preparedStatement, model);
        preparedStatement.setInt(8, model.getId());
    }

    @Override
    public Employee resultSetToEntity(ResultSet resultSet) throws SQLException {
        return new Employee(
                resultSet.getInt("id"),
                resultSet.getString("DPI"),
                resultSet.getString("phone_number"),
                resultSet.getString("names"),
                resultSet.getString("address"),
                resultSet.getString("username"),
                resultSet.getString("img_path"),
                resultSet.getString("self_description")
        );
    }
}
