package dao.entities;


import dao.Dao;
import dao.entitiesHandlers.EmployeeDaoHandler;
import modelo.Employee;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class EmployeeDao extends Dao<Employee> {
    public EmployeeDao() {
        super(new EmployeeDaoHandler());
    }

    public Employee login(String username, String password) throws SQLException {
        PreparedStatement preparedStatement = dbConnection.prepareStatement("select * from Employee where DPI = ? and username  = ?");
        preparedStatement.setString(1, password);
        preparedStatement.setString(2, username);
        System.out.println(preparedStatement.toString());
        System.out.println("password: " + password);
        System.out.println("username: " + username);
        ResultSet resultSet = preparedStatement.executeQuery();

        while (resultSet.next()) {
            return entityDao.resultSetToEntity(resultSet);
        }
        throw new SQLException("no se ha encontrado el usuario");
    }
}
